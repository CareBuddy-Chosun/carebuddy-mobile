import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persisted app language code ("ko" or "en"). Defaults to "ko".
///
/// Drives both the chat reply language (sent to the backend) and the app-wide
/// UI internationalization via `stringsProvider` in `core/l10n/app_strings.dart`.
const String _kLanguagePrefsKey = 'app_language';
const String _kDefaultLanguage = 'ko';

final languageProvider =
    StateNotifierProvider<LanguageNotifier, String>((ref) {
  return LanguageNotifier();
});

class LanguageNotifier extends StateNotifier<String> {
  LanguageNotifier() : super(_kDefaultLanguage) {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(_kLanguagePrefsKey);
    if (stored != null && stored.isNotEmpty) {
      state = stored;
    }
  }

  Future<void> setLanguage(String code) async {
    state = code;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kLanguagePrefsKey, code);
  }
}
