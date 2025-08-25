import 'package:logger/logger.dart';

class LoggerService {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  static Logger get logger => _logger;

  // Méthodes de log avec contexte
  static void info(String message, [String? context]) {
    final logMessage = context != null ? '[$context] $message' : message;
    _logger.i(logMessage);
    print(logMessage); // Pour Cloud Run logs
  }

  static void warning(String message, [String? context]) {
    final logMessage = context != null ? '[$context] $message' : message;
    _logger.w(logMessage);
    print(logMessage); // Pour Cloud Run logs
  }

  static void error(String message, [Object? error, StackTrace? stackTrace, String? context]) {
    final logMessage = context != null ? '[$context] $message' : message;
    _logger.e(logMessage, error: error, stackTrace: stackTrace);
    print(logMessage); // Pour Cloud Run logs
    if (error != null) {
      print('Error details: $error');
    }
  }

  static void debug(String message, [String? context]) {
    final logMessage = context != null ? '[$context] $message' : message;
    _logger.d(logMessage);
    print(logMessage); // Pour Cloud Run logs
  }

  static void verbose(String message, [String? context]) {
    final logMessage = context != null ? '[$context] $message' : message;
    _logger.v(logMessage);
    print(logMessage); // Pour Cloud Run logs
  }
}
