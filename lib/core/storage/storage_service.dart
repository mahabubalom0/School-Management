import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'storage_keys.dart';

class StorageService extends GetxService {
  final GetStorage _box = GetStorage();
  final FlutterSecureStorage _secureBox = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  // ─── Theme ────────────────────────────────────────────────────────────────

  Future<void> saveTheme(String theme) async => _box.write(StorageKeys.themeMode, theme);

  String? getTheme() => _box.read<String>(StorageKeys.themeMode);

  // ─── Language ─────────────────────────────────────────────────────────────

  Future<void> saveLanguage(String lang) async => _box.write(StorageKeys.langCode, lang);

  String? getLanguage() => _box.read<String>(StorageKeys.langCode);

  // ─── Onboarding ───────────────────────────────────────────────────────────

  bool hasOnboarded() => _box.read<bool>(StorageKeys.hasOnboarded) ?? false;

  Future<void> setOnboarded() async => _box.write(StorageKeys.hasOnboarded, true);

  // ─── Auth Tokens ──────────────────────────────────────────────────────────

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    required int expiresIn,
  }) async {
    await _secureBox.write(key: StorageKeys.accessToken, value: accessToken);
    await _secureBox.write(key: StorageKeys.refreshToken, value: refreshToken);
    
    final expiryTime = DateTime.now().millisecondsSinceEpoch + (expiresIn * 1000);
    await _box.write(StorageKeys.tokenExpiry, expiryTime); // Expiry isn't sensitive
  }

  Future<String?> getAccessToken() => _secureBox.read(key: StorageKeys.accessToken);

  Future<String?> getRefreshToken() => _secureBox.read(key: StorageKeys.refreshToken);

  bool isAccessTokenExpired() {
    final expiry = _box.read<int>(StorageKeys.tokenExpiry);
    if (expiry == null) return true;
    return DateTime.now().millisecondsSinceEpoch > expiry;
  }

  Future<void> clearAuth() async {
    await _secureBox.delete(key: StorageKeys.accessToken);
    await _secureBox.delete(key: StorageKeys.refreshToken);
    await _box.remove(StorageKeys.tokenExpiry);
  }

  Future<void> clearAll() async {
    await _box.erase();
    await _secureBox.deleteAll();
  }
}
