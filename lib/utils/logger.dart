import 'package:flutter/foundation.dart';

/// Class utility untuk logging terstruktur yang aman.
///
/// Log hanya akan dicetak di console jika aplikasi berjalan
/// dalam mode debug (kDebugMode).
class Logger {
  static const String _tag = '[APP_LOG]';

  /// Log untuk informasi umum / flow aplikasi
  static void info(String message) {
    if (kDebugMode) {
      print('$_tag ℹ️ [INFO] ${DateTime.now()}: $message');
    }
  }

  /// Log untuk keperluan debugging internal
  static void debug(String message) {
    if (kDebugMode) {
      print('$_tag 🐛 [DEBUG] ${DateTime.now()}: $message');
    }
  }

  /// Log untuk peringatan / warning (non-fatal error)
  static void warning(String message) {
    if (kDebugMode) {
      print('$_tag ⚠️ [WARNING] ${DateTime.now()}: $message');
    }
  }

  /// Log untuk menangkap error / exception
  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      print('$_tag ❌ [ERROR] ${DateTime.now()}: $message');
      if (error != null) {
        print('    Detail Error: $error');
      }
      if (stackTrace != null) {
        print('    StackTrace: $stackTrace');
      }
    }
  }
}