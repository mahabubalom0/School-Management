/// Centralized storage key constants.
/// All [GetStorage] read/write operations must use these keys
/// to prevent typos and key duplication across the codebase.
class StorageKeys {
  StorageKeys._();

  // ─── Auth ─────────────────────────────────────────────────────────────────
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String tokenExpiry = 'expires_in';

  // ─── Preferences ──────────────────────────────────────────────────────────
  static const String themeMode = 'theme_mode';
  static const String langCode = 'lang_code';

  // ─── Onboarding ───────────────────────────────────────────────────────────
  static const String hasOnboarded = 'has_onboarded';

  // ─── Language Code Values (used in Locale resolution) ─────────────────────
  static const String langCodeEn = 'en';
  static const String langCodeAr = 'ar';
  static const String langCodeBn = 'bn';
}
