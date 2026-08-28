import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../storage/storage_service.dart';

class SettingsUtil {
  static final RxString _currentTheme = ''.obs;
  static final RxString _currentLanguage = ''.obs;

  static RxString get currentTheme {
    if (_currentTheme.value.isEmpty) {
      _currentTheme.value = Get.find<StorageService>().getTheme() ?? 'system';
    }
    return _currentTheme;
  }

  static RxString get currentLanguage {
    if (_currentLanguage.value.isEmpty) {
      _currentLanguage.value = Get.find<StorageService>().getLanguage() ?? 'en';
    }
    return _currentLanguage;
  }

  static void changeLanguage(String langCode) {
    currentLanguage.value = langCode;
    if (langCode == 'ar') {
      Get.updateLocale(const Locale('ar', 'SA'));
    } else if (langCode == 'bn') {
      Get.updateLocale(const Locale('bn', 'BD'));
    } else {
      Get.updateLocale(const Locale('en', 'US'));
    }
    Get.find<StorageService>().saveLanguage(langCode);
  }

  static void changeTheme(String themeModeCode) {
    currentTheme.value = themeModeCode;
    if (themeModeCode == 'dark') {
      Get.changeThemeMode(ThemeMode.dark);
    } else if (themeModeCode == 'light') {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.system);
    }
    Get.find<StorageService>().saveTheme(themeModeCode);
  }
}
