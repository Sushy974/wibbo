// ignore_for_file: lines_longer_than_80_chars, public_member_api_docs

import 'package:dart_firebase_admin/firestore.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:wibbo_api/services/logger_service.dart';

extension DateTimeX on DateTime {
  String toStringFile({bool withHour = false}) => '$year'
      '${month.toString().length == 1 ? '0$month' : '$month'}'
      '${day.toString().length == 1 ? '0$day' : '$day'}'
      '${withHour ? '${hour.toString().length == 1 ? '0$hour' : '$hour'}'
          '${minute.toString().length == 1 ? '0$minute' : '$minute'}'
          '${second.toString().length == 1 ? '0$second' : '$second'}'
          '${millisecond.toString().length == 1 ? '0$millisecond' : '$millisecond'}' : ''}';

  static DateTime fromString(String value) {
    final valueSplit = value.split('-');
    final annee = int.parse(valueSplit[0]);
    final mois = int.parse(valueSplit[1]);
    final jour = int.parse(valueSplit[2]);

    return DateTime(annee, mois, jour);
  }
}

extension TimestampX on Timestamp {
  DateTime toDate() {
    final millis = (seconds * 1000) + (nanoseconds ~/ 1000000);

    return DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true);
  }
}

extension ReadAsync on RequestContext {
  Future<T> readAsync<T extends Object>() => read<Future<T>>();
}

// Extension pour faciliter l'accès au logger dans les routes
extension LoggerX on RequestContext {
  void logInfo(String message, [String? context]) {
    LoggerService.info(message, context);
  }

  void logDebug(String message, [String? context]) {
    LoggerService.debug(message, context);
  }

  void logWarning(String message, [String? context]) {
    LoggerService.warning(message, context);
  }

  void logError(String message, [Object? error, StackTrace? stackTrace, String? context]) {
    LoggerService.error(message, error, stackTrace, context);
  }
}
