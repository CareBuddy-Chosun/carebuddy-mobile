# AGENTS.md — carebuddy-mobile

AI 에이전트와 프론트엔드 개발자가 이 Flutter 앱을 빠르게 파악하고 이어서 작업하기 위한 안내 문서입니다. 작업 전에 이 문서를 한 번 통독한 뒤, 해당 섹션을 다시 참고하세요.

> CareBuddy는 음성 기반 AI 헬스케어 트리아지 보조 도구입니다. **진단 도구가 아니며**, 모든 화면에는 비진단 고지가 표시되어야 합니다. 트리아지 결과는 `EMERGENCY`, `VISIT_HOSPITAL`, `HOME_CARE` 세 단계뿐입니다.

---

## 1. 빠른 시작 (Quick Start)

```bash
cd carebuddy-mobile
flutter pub get
flutter run -d chrome --web-port 5050    # 기본: Chrome + mock backend
```

- **기본 실행 환경은 Chrome(web) + Mock 백엔드**입니다. 백엔드 서버 없이 모든 화면이 동작합니다.
- 안드로이드/iOS로 띄우려면 `flutter run -d <device-id>`.
- 실제 백엔드에 붙이려면: `--dart-define=MOCK_BACKEND=false --dart-define=BACKEND_URL=http://<host>:8000`.
- IDE 사용 시 `.vscode/launch.json` 또는 `.idea/runConfigurations/`에 미리 정의된 구성을 고르면 됩니다.

### 코드 검증 명령

```bash
flutter analyze            # 정적 분석 (이슈 0건 유지)
flutter test               # 단위/위젯 테스트
flutter build web          # 웹 컴파일 확인 (CI에 추천)
dart run build_runner build --delete-conflicting-outputs   # freezed/json_serializable 코드 재생성
```

PR을 만들기 전 최소 `flutter analyze`와 `flutter build web`은 통과시키는 것이 좋습니다.

---

## 2. 코드베이스 한눈에 보기

```
lib/
├── main.dart                  # ProviderScope로 CareBuddyApp 부트스트랩
├── app/
│   ├── app.dart               # MaterialApp.router + theme 적용
│   ├── router.dart            # GoRouter 라우트 정의 (단일 소스)
│   └── shell_screen.dart      # 하단 탭 (Home / History / Profile)
├── core/
│   ├── constants/             # AppConstants(플래그·URL·키), AppTheme(색·M3 테마)
│   ├── network/
│   │   ├── dio_client.dart    # Dio + 자동 토큰 갱신 인터셉터
│   │   ├── api_exception.dart # DioException → 사용자 친화 메시지 매핑
│   │   ├── auth_repository.dart
│   │   ├── session_repository.dart
│   │   ├── user_repository.dart
│   │   ├── hospital_repository.dart
│   │   ├── voice_repository.dart
│   │   └── mock/mock_repositories.dart   # 5개 Mock 구현 + 인메모리 스토어
│   ├── services/
│   │   ├── emergency_detector.dart       # 응급 키워드 클라이언트 검출 (SRS FR-015)
│   │   ├── tts_service.dart              # 백엔드 TTS 호출 + audioplayers 재생
│   │   └── voice_flow_controller.dart    # TTS → STT 상태 머신
│   ├── storage/secure_storage.dart       # flutter_secure_storage 래퍼
│   └── utils/                            # validators, date_formatter
├── features/<feature>/presentation/
│   ├── screens/      # ConsumerStatefulWidget / ConsumerWidget 페이지
│   ├── widgets/      # 페이지 단위 위젯
│   └── providers/    # StateNotifier + State 클래스
└── shared/
    ├── models/       # freezed + json_serializable 모델
    └── widgets/      # 범용 위젯 (confirmation_dialog, error_display)
```

### 핵심 원칙

- **feature-first 폴더 구조.** 새 기능은 `lib/features/<name>/presentation/{screens,widgets,providers}/` 패턴으로 만듭니다.
- **상태는 항상 Riverpod.** 화면 임시 상태는 `StatefulWidget`의 `setState`, 도메인/네트워크 상태는 `StateNotifierProvider`로 관리합니다 (`features/*/presentation/providers/` 참고).
- **모든 네트워크 호출은 Repository를 통해.** 위젯/Provider가 `Dio`를 직접 다루지 않습니다.
- **모델은 freezed.** 새 모델은 `shared/models/`에 `@freezed` + `fromJson/toJson` 패턴으로 추가하고 `build_runner`로 생성합니다.

---

## 3. Mock 백엔드 시스템 (가장 중요)

백엔드 없이 모든 화면이 동작하도록 `lib/core/network/mock/mock_repositories.dart`에 5개 Mock Repository가 구현되어 있습니다. **기본값으로 ON**입니다.

### ON/OFF 스위치

- `AppConstants.useMockBackend` (`lib/core/constants/app_constants.dart`).
- 기본값 `true`. 실제 백엔드를 쓰려면 `--dart-define=MOCK_BACKEND=false`.
- 각 Repository Provider 상단에서 이 플래그를 확인해 Mock/Real 구현을 분기합니다.

```dart
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  if (AppConstants.useMockBackend) {
    return MockAuthRepository();
  }
  return AuthRepository(ref.read(dioProvider));
});
```

### 인메모리 데이터 스토어

Mock 파일 안의 `_MockStore`(싱글톤)가 다음을 들고 있습니다:

- `profile` — 데모 사용자("김보호") + 보호자 1명.
- `sessions` — 데모 세션 2개 + 새로 만든 세션들이 prepend 됩니다.
- `nextId(prefix)` — 단조 증가 ID 생성기.

앱 재시작 시 휘발됩니다. 영속화가 필요하면 `_MockStore`에 `SharedPreferences` 직렬화를 추가하세요.

### Mock "AI" 대화 룰 (`_MockChatBrain`)

룰베이스 분기로 트리아지를 흉내냅니다:

1. `EmergencyDetector`가 응급 키워드를 잡으면 → `EMERGENCY` + 세션 종료.
2. 첫 사용자 발화 → 후속 질문 + 빠른 답변(quick replies) 제공.
3. 두 번째 발화에서 "고열/구토/심한/지속/피/출혈" 등 키워드 매칭 → `VISIT_HOSPITAL`.
4. 그 외 → `HOME_CARE`.

새 트리아지 시나리오나 keyword 패턴을 추가하려면 이 함수만 고치면 됩니다.

### Mock을 새 화면에 확장하는 절차

새 엔드포인트를 도입할 때:

1. `shared/models/`에 freezed 모델 추가, `build_runner` 실행.
2. `lib/core/network/<feature>_repository.dart`에 Real 구현 작성 (Dio 호출 + `ApiException.fromDioException`).
3. `mock_repositories.dart`에 `MockXxxRepository extends XxxRepository` 추가하고 모든 메서드 오버라이드 (super에는 `Dio()` 더미 전달).
4. 해당 Provider에 `useMockBackend` 분기 추가 (기존 Repository와 동일한 패턴).

### TTS 동작

`MockVoiceRepository.synthesizeSpeech`는 빈 `Uint8List`를 반환합니다. `TtsService.speak`는 빈 페이로드면 재생을 건너뛰고 즉시 `onComplete`을 호출합니다 → UI는 정상 진행됩니다.

---

## 4. 라우팅

라우트는 `lib/app/router.dart` 한 곳에서만 정의합니다. 추가 시 같은 파일에 `GoRoute`를 더 적습니다.

| 경로 | 화면 | 메모 |
|---|---|---|
| `/login` | `LoginScreen` | 초기 경로 |
| `/register` | `RegisterScreen` | |
| `/home` | `ShellScreen` | 하단 탭 (Home/History/Profile) |
| `/consultation` | `ConsultationScreen` | `state.extra`로 기존 sessionId 전달 가능 |
| `/session/:id` | `SessionDetailScreen` | path param |
| `/hospitals` | `HospitalScreen` | `state.extra`로 triageLevel(`EMERGENCY` 등) 전달 |
| `/history` | `HistoryScreen` | |
| `/profile` | `ProfileScreen` | |
| `/profile/guardians` | `GuardianListScreen` | |
| `/profile/guardians/add` | `GuardianFormScreen` | |

> **인증 가드 미구현.** 로그인하지 않아도 모든 라우트에 접근 가능합니다. 추후 `GoRouter`의 `redirect`로 `secureStorageProvider`의 토큰 유무를 보고 `/login`으로 리다이렉트하는 처리가 필요합니다 (`authProvider.checkAuthStatus` 활용).

---

## 5. 상태 관리 패턴 (Riverpod)

이 프로젝트는 **수동 StateNotifier 패턴**을 일관되게 사용합니다 (riverpod_generator는 의존성에만 있고 실 사용은 거의 없음).

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

**규칙**

- State 클래스는 불변 + `copyWith` (freezed로 만들어도 좋지만 현재 코드는 수동).
- `error`는 `String?`로 보관하고, 화면에서 `ref.listen`으로 스낵바를 띄웁니다 (`consultation_screen.dart` 참조).
- `ApiException`을 잡아 `e.userMessage`를 state에 넣습니다. 그 외 예외는 `e.toString()`.
- **`StateNotifierProvider.autoDispose`** 는 세션처럼 화면 이탈 시 폐기되어야 하는 상태에만 사용합니다 (`consultation_provider.dart`).

---

## 6. 네트워크 레이어

### `dio_client.dart`

- baseUrl = `${AppConstants.baseUrl}${AppConstants.apiPrefix}` (기본 `http://localhost:8000/api/v1`).
- `_AuthInterceptor`가 모든 요청에 `Authorization: Bearer <token>` 헤더 자동 부착.
- 401 응답 시 `/auth/refresh`로 토큰 재발급 후 원 요청 재시도. **동시에 발생한 401들은 단일 Completer로 직렬화**되어 refresh 폭주를 방지합니다.

### Repository 작성 패턴

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

**규칙**

- 모든 메서드에서 `DioException`을 잡아 `ApiException.fromDioException(e)`로 변환해 던집니다.
- 응답 파싱은 `freezed`의 `fromJson` 사용.
- 바이너리는 `responseType: ResponseType.bytes` (`voice_repository.dart` 참조).

### `ApiException`

- 4xx/5xx/network/unknown 으로 type 분류 (`ApiErrorType`).
- `userMessage` getter가 사용자에게 보여줄 짧은 메시지를 반환합니다 — 이 값을 그대로 스낵바에 쓰면 됩니다.

---

## 7. 도메인 모델 (Freezed)

`shared/models/` 에 정의되어 있고, 핵심만 정리:

- `TokenResponse` — `{accessToken, refreshToken, userId?, expiresIn}`.
- `UserProfile`, `Guardian`, `GuardianCreate`, `UserProfileUpdate`.
- `SessionResponse` — `{id, status, triageLevel?, messages[], ...}`.
- `MessageModel` — `{id, role('user'|'assistant'), content, createdAt}`.
- `ChatResponse` — `sendMessage`의 응답. `reply`, `triageResult?`, `quickReplyOptions?`, `ttsText?`, `isEmergency`, `sessionComplete`.
- `TriageResult` — `{level, explanation?, nextSteps[], disclaimer, emergencyKeywordsDetected[]}`.
- `Hospital`, `HospitalSearchResponse`.
- `NotificationResponse`.

**모델 수정 시**

1. `.dart` 파일 수정.
2. `dart run build_runner build --delete-conflicting-outputs` 실행 (또는 `watch`).
3. `*.freezed.dart`, `*.g.dart`는 자동 생성물이므로 직접 편집 금지.

---

## 8. 음성 흐름

`lib/core/services/voice_flow_controller.dart`가 TTS → STT 상태 머신입니다 (`idle → ttsPlaying → listening → processing`).

- **STT**: `speech_to_text` 패키지를 `widgets/voice_input_button.dart`에서 직접 사용. 현재 `localeId: 'en_US'` 하드코딩 — 한국어로 바꾸려면 `'ko_KR'`로 변경 + 디바이스 지원 확인.
- **TTS**: 백엔드의 `/tts/synthesize`가 mp3 바이트 반환 → `tts_service.dart`가 임시 파일에 저장 후 `audioplayers`로 재생. Web에서는 `BytesSource`로 메모리 재생.
- **응급 키워드 즉시 감지**: `emergency_detector.dart`. 사용자 발화가 서버로 가기 전에 클라이언트에서 먼저 매칭합니다 (SRS FR-015).
  - **현재 키워드는 영어**. 한국어 화면이면 한국어 키워드 추가가 우선순위 높은 작업입니다.

---

## 9. 플랫폼별 주의사항

| 항목 | Web (Chrome) | Android/iOS |
|---|---|---|
| `flutter_secure_storage` | localStorage(암호화) — 동작함 | Keychain/Keystore |
| `geolocator` | 브라우저 위치 권한, mock 모드면 우회 | OS 권한, 실 GPS |
| `path_provider.getTemporaryDirectory` | **지원 안 함** — `kIsWeb` 가드 필요 | 정상 |
| `dart:io File` | **런타임 에러** — `kIsWeb` 가드 필요 | 정상 |
| `audioplayers` | `BytesSource` 사용 | `DeviceFileSource` 사용 |
| `speech_to_text` | 브라우저 Web Speech API (Chrome 지원) | OS 네이티브 |
| `record` | 브라우저 MediaRecorder | OS 네이티브 |

**Web 호환성을 깨지 않으려면 새 코드에 `dart:io`, `path_provider`, `File` 등을 직접 쓰기 전 항상 `kIsWeb` 분기 또는 plugin이 web을 지원하는지 확인하세요.** (`tts_service.dart`의 `_playBytes` 패턴 참고.)

---

## 10. 주요 비즈니스 규칙

- **트리아지는 3단계만**: `EMERGENCY`, `VISIT_HOSPITAL`, `HOME_CARE`. `AppConstants` 상수 사용.
- **비진단 고지 필수**: 트리아지를 보여주는 모든 화면에 `TriageResult.disclaimer` 또는 자체 문구 표시.
- **응급 감지는 이중**: ① 클라이언트(`EmergencyDetector`)에서 발화 직후 ② 백엔드 트리아지 엔진. 한 쪽이라도 hit이면 `state.isEmergency = true`.
- **응급 시 보호자 알림 + 가까운 응급실**: 응급 시 `EmergencyBanner`에서 `notifyGuardians()`와 `/hospitals?level=EMERGENCY`를 함께 노출.

---

## 11. 자주 하는 작업 (How-Tos)

### 새 화면 추가

1. `lib/features/<name>/presentation/screens/<name>_screen.dart` 작성 (`ConsumerStatefulWidget` 권장).
2. 상태가 있다면 `presentation/providers/<name>_provider.dart`에 `StateNotifier` + `State` 작성.
3. `lib/app/router.dart`에 `GoRoute` 추가.
4. 진입점 위젯에서 `context.push('/path')` 또는 `context.go('/path')`.

### 새 API 엔드포인트 연결

1. (필요 시) `shared/models/`에 freezed 모델 추가 → `build_runner`.
2. 적절한 Repository에 메서드 추가 (`try/on DioException` 패턴 준수).
3. **반드시 `mock_repositories.dart`의 Mock 클래스에도 같은 메서드 오버라이드** — 빠뜨리면 Mock 모드에서 실 Dio 호출이 나갑니다.
4. Provider/State에서 사용.

### 새 사용자 메시지/문구 추가

지금은 i18n이 없습니다. 화면 상수 문자열을 직접 편집해도 되지만, 본격적인 다국어가 필요해지면 `intl` + `gen_l10n` 도입을 권장합니다 (`intl`은 이미 pubspec에 있음).

### 디버깅: Mock 동작이 이상할 때

- `_MockStore.instance.sessions` 가 prepend 방식이라 `History`는 항상 최신 세션부터 표시됩니다.
- 새 세션은 어시스턴트 인사말 1개를 가지고 시작합니다.
- 같은 세션에서 사용자가 두 번째 발화를 하면 항상 트리아지가 결정되어 `sessionComplete=true`가 됩니다. 멀티턴 대화를 더 길게 하고 싶으면 `_MockChatBrain.reply`의 `userTurnCount` 로직을 늘리세요.

---

## 12. 알려진 미해결 항목 (Backlog)

작성일 기준 코드를 그대로 읽었을 때 명시적으로 부족한 부분들입니다. 신규 작업의 우선순위로 활용하세요.

- **인증 가드**: `router.dart`에 `redirect`가 없어 비로그인 상태로도 모든 라우트 진입 가능.
- **한국어 i18n**: UI 문자열이 영/한 혼재. `EmergencyDetector` 키워드도 영어만.
- **`google_maps_flutter` 미사용**: pubspec엔 있지만 실제 사용 코드가 없음. 병원 지도 보기 기능이 필요해지면 web에서는 `google_maps_flutter_web` 셋업 + JS API 키가 필요.
- **녹음(`record`) 미통합**: 현재는 `speech_to_text`만 사용. 백엔드 STT를 쓰는 흐름은 코드가 없음.
- **테스트**: `test/widget_test.dart` 1개만 존재. Provider/Repository 유닛 테스트 미작성.
- **Mock 영속성**: 앱 재시작 시 mock 데이터 초기화 → 시연 영상 찍기 전 주의.
- **세션 상세에서 보호자 알림 재시도**: 현재 `EmergencyBanner`에서만 가능.

---

## 13. AI 에이전트가 작업할 때의 체크리스트

1. **백엔드 가정 금지.** 모든 새 기능은 Mock 백엔드에서 먼저 동작해야 합니다. `mock_repositories.dart`에 짝맞는 fake 구현을 같이 추가하세요.
2. **freezed 모델 변경 후엔 build_runner 실행.** 빠뜨리면 컴파일 에러.
3. **Web 호환성 유지.** 새 의존성/플랫폼 API 도입 시 `flutter build web`이 통과하는지 확인.
4. **State 변경은 항상 `state = state.copyWith(...)`.** 직접 필드 수정 금지.
5. **에러 처리 일관성.** Repository → `ApiException` throw, Provider → `e.userMessage`를 `state.error`에 저장, Screen → `ref.listen`으로 스낵바.
6. **트리아지/응급 분기 변경 시 SRS 의도 확인.** 임의로 단계 추가/제거 금지 (3단계 고정).
7. **`flutter analyze` 0 이슈를 유지.** 경고도 남기지 마세요.
8. **CLAUDE.md(루트) 와 충돌하지 않는지 확인.** 백엔드 동작 규칙은 거기에 있습니다.

---

## 14. 참고 위치 (빠른 색인)

- 라우트 한눈에: `lib/app/router.dart`
- 환경 플래그/상수: `lib/core/constants/app_constants.dart`
- 색·테마: `lib/core/constants/app_theme.dart`
- Mock 전체: `lib/core/network/mock/mock_repositories.dart`
- 응급 키워드: `lib/core/services/emergency_detector.dart`
- 음성 상태 머신: `lib/core/services/voice_flow_controller.dart`
- 채팅 화면(가장 복잡): `lib/features/consultation/presentation/screens/consultation_screen.dart`
- 인증 흐름: `lib/features/auth/presentation/providers/auth_provider.dart` + `core/storage/secure_storage.dart`

문서가 코드와 어긋난다고 느껴지면 **코드를 신뢰하고 이 문서를 업데이트**하세요. AI 에이전트는 변경 후 이 AGENTS.md도 함께 갱신하는 것을 기본 동작으로 삼습니다.
