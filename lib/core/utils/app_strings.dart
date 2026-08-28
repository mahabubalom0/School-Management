/// Centralized localization key constants.
/// Use these instead of bare string literals like `'welcome_back'.tr`
/// to prevent typos and make key usage traceable across the codebase.
class AppStrings {
  AppStrings._();

  // ─── App Info ─────────────────────────────────────────────────────────────
  static const String appName = 'app_name';
  static const String appTagline = 'app_tagline';

  // ─── Navigation / Tabs ────────────────────────────────────────────────────
  static const String tabHome = 'tab_home';
  static const String tabExplore = 'tab_explore';
  static const String tabAlerts = 'tab_alerts';
  static const String tabSaved = 'tab_saved';
  static const String tabProfile = 'tab_profile';
  static const String homeTitle = 'home_title';

  // ─── Onboarding ───────────────────────────────────────────────────────────
  static const String onboardingWelcome = 'onboarding_welcome';
  static const String onboardingDesc = 'onboarding_desc';
  static const String register = 'register';

  // ─── Auth ─────────────────────────────────────────────────────────────────
  static const String welcomeBack = 'welcome_back';
  static const String loginToContinue = 'login_to_continue';
  static const String email = 'email';
  static const String emailHint = 'email_hint';
  static const String password = 'password';
  static const String passwordHint = 'password_hint';
  static const String rememberMe = 'remember_me';
  static const String forgotPassword = 'forgot_password';
  static const String createWith = 'create_with';
  static const String google = 'google';
  static const String facebook = 'facebook';
  static const String login = 'login';
  static const String noAccount = 'no_account';
  static const String signUp = 'sign_up';
  static const String loginError = 'login_error';
  static const String fillFields = 'fill_fields';

  // ─── Profile / Settings ───────────────────────────────────────────────────
  static const String settingsTitle = 'settings_title';
  static const String theme = 'theme';
  static const String themeAuto = 'theme_auto';
  static const String themeLight = 'theme_light';
  static const String themeDark = 'theme_dark';
  static const String language = 'language';
  static const String langEn = 'lang_en';
  static const String langAr = 'lang_ar';
  static const String langBn = 'lang_bn';
  static const String logout = 'logout';

  // ─── Common ───────────────────────────────────────────────────────────────
  static const String error = 'error';
  static const String success = 'success';
  static const String loading = 'loading';
  static const String networkError = 'network_error';
  static const String noInternet = 'no_internet';
  static const String requestTimeout = 'request_timeout';
  static const String requestFailed = 'request_failed';
}
