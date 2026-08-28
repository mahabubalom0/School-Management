import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 80,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.none,
    ),
  );

  static void logInfo(String message) {
    if (kDebugMode) {
      _logger.i(message);
    }
  }

  static void logError(String message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      _logger.e(message, error: error, stackTrace: stackTrace);
    }
  }

  static void logWarning(String message) {
    if (kDebugMode) {
      _logger.w(message);
    }
  }

  static void logDebug(String message) {
    if (kDebugMode) {
      _logger.d(message);
    }
  }
}
