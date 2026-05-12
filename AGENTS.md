# AGENTS.md — carebuddy-mobile

A guide for AI agents and frontend developers to ramp up on this Flutter app and continue development. Read it through once, then refer back to specific sections as needed.

> CareBuddy is a voice-first AI healthcare triage assistant. **It is not a diagnostic tool** — every screen must show a non-diagnostic disclaimer. There are exactly three triage levels: `EMERGENCY`, `VISIT_HOSPITAL`, `HOME_CARE`.

A Korean version of this document is available at `AGENT_KR.md`. Keep both in sync when you change one.

---

## 1. Quick Start

```bash
cd carebuddy-mobile
flutter pub get
flutter run -d chrome --web-port 5050    # default: Chrome + mock backend
```

- **The default run target is Chrome (web) with a mock backend.** Every screen works without any backend server running.
- To run on Android/iOS: `flutter run -d <device-id>`.
- To hit a real backend: `--dart-define=MOCK_BACKEND=false --dart-define=BACKEND_URL=http://<host>:8000`.
- IDE users can pick a preconfigured launch from `.vscode/launch.json` or `.idea/runConfigurations/`.

### Verification commands

```bash
flutter analyze            # static analysis (keep at 0 issues)
flutter test               # unit + widget tests
flutter build web          # web compilation check (recommended in CI)
dart run build_runner build --delete-conflicting-outputs   # regen freezed/json_serializable
```

Before opening a PR, at minimum make sure `flutter analyze` and `flutter build web` pass.

---

## 2. Codebase at a glance

```
lib/
├── main.dart                  # Bootstraps CareBuddyApp inside ProviderScope
├── app/
│   ├── app.dart               # MaterialApp.router + theme
│   ├── router.dart            # GoRouter route definitions (single source of truth)
│   └── shell_screen.dart      # Bottom tabs (Home / History / Profile)
├── core/
│   ├── constants/             # AppConstants (flags, URLs, keys), AppTheme (colors, M3)
│   ├── network/
│   │   ├── dio_client.dart    # Dio + automatic token-refresh interceptor
│   │   ├── api_exception.dart # DioException → user-friendly message mapping
│   │   ├── auth_repository.dart
│   │   ├── session_repository.dart
│   │   ├── user_repository.dart
│   │   ├── hospital_repository.dart
│   │   ├── voice_repository.dart
│   │   └── mock/mock_repositories.dart   # 5 mock implementations + in-memory store
│   ├── services/
│   │   ├── emergency_detector.dart       # Client-side emergency keyword detector (SRS FR-015)
│   │   ├── tts_service.dart              # Calls backend TTS, plays bytes via audioplayers
│   │   └── voice_flow_controller.dart    # TTS → STT state machine
│   ├── storage/secure_storage.dart       # flutter_secure_storage wrapper
│   └── utils/                            # validators, date_formatter
├── features/<feature>/presentation/
│   ├── screens/      # ConsumerStatefulWidget / ConsumerWidget pages
│   ├── widgets/      # Page-scoped widgets
│   └── providers/    # StateNotifier + State classes
└── shared/
    ├── models/       # freezed + json_serializable models
    └── widgets/      # Generic widgets (confirmation_dialog, error_display)
```

### Core principles

- **Feature-first folder structure.** New features go under `lib/features/<name>/presentation/{screens,widgets,providers}/`.
- **State is always Riverpod.** Local UI state lives in `StatefulWidget.setState`; domain/network state lives in `StateNotifierProvider` (see `features/*/presentation/providers/`).
- **All network calls flow through a Repository.** Widgets and providers never touch `Dio` directly.
- **Models are freezed.** Add new models under `shared/models/` with `@freezed` and `fromJson/toJson`, then run `build_runner`.

---

## 3. Mock backend system (most important section)

The app ships with five mock repositories in `lib/core/network/mock/mock_repositories.dart` so every screen runs without a backend. **It is ON by default.**

### The on/off switch

- `AppConstants.useMockBackend` in `lib/core/constants/app_constants.dart`.
- Defaults to `true`. Pass `--dart-define=MOCK_BACKEND=false` to hit the real backend.
- Each repository provider checks this flag and returns either the mock or the real implementation:

```dart
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  if (AppConstants.useMockBackend) {
    return MockAuthRepository();
  }
  return AuthRepository(ref.read(dioProvider));
});
```

### The in-memory store

A singleton `_MockStore` inside the mock file holds:

- `profile` — a demo user (`김보호` / `demo@carebuddy.app`) plus one guardian.
- `sessions` — two seeded sessions, plus any new sessions prepended to the list.
- `nextId(prefix)` — a monotonic ID generator.

The store is volatile — it resets every time the app reloads. If you need persistence, wire `_MockStore` to `SharedPreferences`.

### The mock "AI" chat brain (`_MockChatBrain`)

A tiny rule-based decision tree simulates triage:

1. If `EmergencyDetector` matches an emergency keyword → `EMERGENCY` + session ends.
2. On the user's first message → a clarifying follow-up question plus quick-reply buttons.
3. On the second message, if it contains keywords like "fever / vomit / severe / persistent / blood" (mixed Korean + English) → `VISIT_HOSPITAL`.
4. Otherwise → `HOME_CARE`.

Modify this function when you want richer demo scenarios or new keyword patterns.

### How to extend mocks for a new endpoint

When you add a new backend call:

1. Add the freezed model(s) under `shared/models/`, then run `build_runner`.
2. Add the real method in the appropriate repository in `lib/core/network/<feature>_repository.dart` (wrap Dio calls with `try / on DioException` → `ApiException.fromDioException`).
3. Add a `MockXxxRepository extends XxxRepository` method in `mock_repositories.dart` that overrides the new method. Pass a dummy `Dio()` to `super(...)`.
4. The provider already branches on `useMockBackend`, so nothing else to wire up.

**If you skip step 3, mock mode will fall through to the real Dio call and fail.**

### TTS behavior under mock

`MockVoiceRepository.synthesizeSpeech` returns an empty `Uint8List`. `TtsService.speak` detects the empty payload, skips playback, and immediately invokes `onComplete` — so the UI flow continues normally.

---

## 4. Routing

All routes live in `lib/app/router.dart`. Add new ones in the same file.

| Path | Screen | Notes |
|---|---|---|
| `/login` | `LoginScreen` | initial location |
| `/register` | `RegisterScreen` | |
| `/home` | `ShellScreen` | bottom tabs (Home / History / Profile) |
| `/consultation` | `ConsultationScreen` | pass an existing `sessionId` via `state.extra` |
| `/session/:id` | `SessionDetailScreen` | path param |
| `/hospitals` | `HospitalScreen` | pass `triageLevel` (e.g. `EMERGENCY`) via `state.extra` |
| `/history` | `HistoryScreen` | |
| `/profile` | `ProfileScreen` | |
| `/profile/guardians` | `GuardianListScreen` | |
| `/profile/guardians/add` | `GuardianFormScreen` | |

> **No auth guard yet.** Any route can be opened without logging in. Add a `GoRouter.redirect` that reads the token from `secureStorageProvider` (or watches `authProvider`) and redirects to `/login` when missing.

---

## 5. State management pattern (Riverpod)

The project uses **hand-written StateNotifiers** consistently. `riverpod_generator` is in the dependency list but is barely used today.

```dart
class FooState {
  const FooState({this.data = const [], this.isLoading = false, this.error});
  final List<Foo> data;
  final bool isLoading;
  final String? error;
  FooState copyWith({...}) => FooState(...);
}

final fooProvider =
    StateNotifierProvider<FooNotifier, FooState>((ref) => FooNotifier(ref));

class FooNotifier extends StateNotifier<FooState> {
  FooNotifier(this._ref) : super(const FooState());
  final Ref _ref;

  Future<void> load() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final repo = _ref.read(fooRepositoryProvider);
      final data = await repo.list();
      state = state.copyWith(data: data, isLoading: false);
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, error: e.userMessage);
    }
  }
}
```

**Rules**

- State classes are immutable and expose `copyWith` (freezed is fine but the current code is hand-written).
- Keep `error` as `String?`; screens listen for changes via `ref.listen` and show a snackbar (see `consultation_screen.dart`).
- Catch `ApiException` and store `e.userMessage`. For other errors fall back to `e.toString()`.
- Use **`StateNotifierProvider.autoDispose`** only when the state should be discarded on screen exit (see `consultation_provider.dart`).

---

## 6. Network layer

### `dio_client.dart`

- `baseUrl` = `${AppConstants.baseUrl}${AppConstants.apiPrefix}` (default `http://localhost:8000/api/v1`).
- `_AuthInterceptor` attaches `Authorization: Bearer <token>` to every request.
- On a 401, it calls `/auth/refresh`, then retries the original request. **Concurrent 401s are serialized through a single `Completer`** so we never fire two refresh calls in parallel.

### Repository pattern

```dart
class FooRepository {
  FooRepository(this._dio);
  final Dio _dio;

  Future<Foo> getFoo(String id) async {
    try {
      final response = await _dio.get('/foos/$id');
      return Foo.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
```

**Rules**

- Every method wraps Dio calls in `try / on DioException` and rethrows as `ApiException.fromDioException(e)`.
- Parse responses with the freezed `fromJson`.
- For binary responses, pass `responseType: ResponseType.bytes` (see `voice_repository.dart`).

### `ApiException`

- Classifies errors as `ApiErrorType.{unauthorized, notFound, conflict, validation, unsupportedMedia, serverError, networkError, unknown}`.
- The `userMessage` getter returns a short, user-facing string — feed it straight to a snackbar.

---

## 7. Domain models (freezed)

Defined in `shared/models/`. Highlights:

- `TokenResponse` — `{accessToken, refreshToken, userId?, expiresIn}`.
- `UserProfile`, `Guardian`, `GuardianCreate`, `UserProfileUpdate`.
- `SessionResponse` — `{id, status, triageLevel?, messages[], ...}`.
- `MessageModel` — `{id, role('user'|'assistant'), content, createdAt}`.
- `ChatResponse` — the `sendMessage` response: `reply`, `triageResult?`, `quickReplyOptions?`, `ttsText?`, `isEmergency`, `sessionComplete`.
- `TriageResult` — `{level, explanation?, nextSteps[], disclaimer, emergencyKeywordsDetected[]}`.
- `Hospital`, `HospitalSearchResponse`.
- `NotificationResponse`.

**When you change a model**

1. Edit the `.dart` file.
2. Run `dart run build_runner build --delete-conflicting-outputs` (or `watch`).
3. Never hand-edit `*.freezed.dart` / `*.g.dart` — they are generated.

---

## 8. Voice flow

`lib/core/services/voice_flow_controller.dart` is the TTS → STT state machine (`idle → ttsPlaying → listening → processing`).

- **STT**: `speech_to_text` is used directly by `widgets/voice_input_button.dart`. `localeId: 'en_US'` is hardcoded — change to `'ko_KR'` for Korean, and verify device support.
- **TTS**: the backend's `/tts/synthesize` returns mp3 bytes. On native, `tts_service.dart` writes the bytes to a temp file and plays with `audioplayers`. On web, it uses `BytesSource` (in-memory).
- **Client-side emergency detection**: `emergency_detector.dart` runs synchronously before sending a message, per SRS FR-015.
  - **Current keywords are English only.** Adding Korean keywords is high priority for a Korean-facing UI.

---

## 9. Platform notes

| Concern | Web (Chrome) | Android/iOS |
|---|---|---|
| `flutter_secure_storage` | encrypted localStorage — works | Keychain / Keystore |
| `geolocator` | browser geolocation prompt; bypassed under mock mode | OS permission + GPS |
| `path_provider.getTemporaryDirectory` | **not supported** — guard with `kIsWeb` | works |
| `dart:io File` | **runtime error** — guard with `kIsWeb` | works |
| `audioplayers` | use `BytesSource` | use `DeviceFileSource` |
| `speech_to_text` | Web Speech API (Chrome works) | OS native |
| `record` | MediaRecorder | OS native |

**To keep web compatibility, always check `kIsWeb` before using `dart:io`, `path_provider`, `File`, or any plugin without web support.** Follow the `_playBytes` pattern in `tts_service.dart`.

---

## 10. Business rules

- **Three triage levels only**: `EMERGENCY`, `VISIT_HOSPITAL`, `HOME_CARE`. Use the constants in `AppConstants`.
- **Non-diagnostic disclaimer is required** on every screen that surfaces a triage result. Use `TriageResult.disclaimer` or an inline message.
- **Emergency detection is two-layered**: ① client-side (`EmergencyDetector`) right after the user types/speaks ② backend triage engine. If either hits, `state.isEmergency = true`.
- **On emergency, show both the guardian-notify and the nearby-ER actions** — see `EmergencyBanner`, which calls `notifyGuardians()` and pushes `/hospitals` with `EMERGENCY`.

---

## 11. How-tos

### Add a new screen

1. Create `lib/features/<name>/presentation/screens/<name>_screen.dart` (prefer `ConsumerStatefulWidget`).
2. If it has non-trivial state, add `presentation/providers/<name>_provider.dart` with a `StateNotifier` + state class.
3. Register a `GoRoute` in `lib/app/router.dart`.
4. Navigate with `context.push('/path')` or `context.go('/path')`.

### Wire a new API endpoint

1. (If needed) add a freezed model under `shared/models/`, then `build_runner`.
2. Add the method to the matching repository (`try / on DioException` pattern).
3. **Override the same method in the mock repository** — otherwise mock mode falls through to a real Dio call.
4. Consume it from your provider/state.

### Add a new user-facing string

There is no i18n setup yet. Hardcoding the string in a widget is acceptable for now, but if multilingual support becomes a goal, adopt `intl` + `gen_l10n` (the `intl` package is already in `pubspec.yaml`).

### Debugging odd mock behavior

- `_MockStore.instance.sessions` is prepended on create, so History always shows the newest session first.
- New sessions start with one assistant greeting message.
- Within the same session, the **second** user message always resolves to a triage decision and sets `sessionComplete=true`. For longer multi-turn dialogs, expand the `userTurnCount` branch in `_MockChatBrain.reply`.

---

## 12. Known gaps (backlog)

Things that are explicitly missing or incomplete at the time of writing. Treat these as candidate first issues.

- **Auth guard**: `router.dart` has no `redirect`, so unauthenticated users can reach every route.
- **Korean i18n**: UI strings mix English and Korean. `EmergencyDetector` keywords are English only.
- **`google_maps_flutter` unused**: declared in `pubspec.yaml` but no code uses it. If you add a hospital map, the web target needs `google_maps_flutter_web` setup + a JS Maps API key.
- **`record` not wired in**: only `speech_to_text` is used today. There is no path that sends raw audio to a backend STT endpoint.
- **Tests**: only `test/widget_test.dart` exists. No provider or repository unit tests.
- **Mock persistence**: mock data resets on reload. Beware before recording a demo.
- **Guardian notification retry**: only triggered from `EmergencyBanner`; not available from `SessionDetailScreen`.

---

## 13. Checklist for AI agents

1. **Never assume the backend is running.** Every new feature must work with mock mode. Add a matching fake to `mock_repositories.dart`.
2. **Run `build_runner` after editing any freezed model.** Skipping this breaks compilation.
3. **Keep the web build green.** When you add a plugin or platform API, verify `flutter build web` still succeeds.
4. **Mutate state only with `state = state.copyWith(...)`.** Never mutate fields in place.
5. **Stay consistent on errors.** Repository throws `ApiException`; provider stores `e.userMessage` in `state.error`; screen surfaces it via `ref.listen` + snackbar.
6. **Don't touch the triage taxonomy.** Three levels, no more, no less. Confirm against the SRS before changing emergency or triage logic.
7. **Keep `flutter analyze` at 0 issues.** Warnings included.
8. **Don't conflict with the root `CLAUDE.md`.** It documents the backend's behavior; align with it when integrating real endpoints.

---

## 14. Quick index

- All routes: `lib/app/router.dart`
- Environment flags + constants: `lib/core/constants/app_constants.dart`
- Colors + theme: `lib/core/constants/app_theme.dart`
- Entire mock backend: `lib/core/network/mock/mock_repositories.dart`
- Emergency keywords: `lib/core/services/emergency_detector.dart`
- Voice state machine: `lib/core/services/voice_flow_controller.dart`
- Most complex screen (chat): `lib/features/consultation/presentation/screens/consultation_screen.dart`
- Auth flow: `lib/features/auth/presentation/providers/auth_provider.dart` + `core/storage/secure_storage.dart`

If this document disagrees with the code, **trust the code and update this document**. AI agents working on this repo are expected to keep `AGENTS.md` (and `AGENT_KR.md`) up to date as part of their default behavior.
