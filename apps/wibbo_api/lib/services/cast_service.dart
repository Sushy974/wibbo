// ignore_for_file: public_member_api_docs

/// Service pour gérer les conversions de types numériques de manière sécurisée
class CastService {
  /// Convertit une valeur en int de manière sécurisée
  /// Accepte int, double, String numérique, ou null
  static int? toInt(dynamic value) {
    if (value == null) return null;

    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) {
      final numValue = num.tryParse(value);
      return numValue?.toInt();
    }
    if (value is num) return value.toInt();

    return null;
  }

  /// Convertit une valeur en double de manière sécurisée
  /// Accepte int, double, String numérique, ou null
  static double? toDouble(dynamic value) {
    if (value == null) return null;

    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      return num.tryParse(value)?.toDouble();
    }
    if (value is num) return value.toDouble();

    return null;
  }

  /// Convertit une valeur en String de manière sécurisée
  static String? toStringValue(dynamic value) {
    if (value == null) return null;
    return value.toString();
  }

  /// Convertit une valeur en bool de manière sécurisée
  static bool? toBool(dynamic value) {
    if (value == null) return null;

    if (value is bool) return value;
    if (value is String) {
      return value.toLowerCase() == 'true' || value == '1';
    }
    if (value is int) return value != 0;
    if (value is double) return value != 0.0;

    return null;
  }

  /// Convertit une valeur en int avec une valeur par défaut
  static int toIntWithDefault(dynamic value, int defaultValue) {
    return toInt(value) ?? defaultValue;
  }

  /// Convertit une valeur en double avec une valeur par défaut
  static double toDoubleWithDefault(dynamic value, double defaultValue) {
    return toDouble(value) ?? defaultValue;
  }

  /// Convertit une valeur en String avec une valeur par défaut
  static String toStringWithDefault(dynamic value, String defaultValue) {
    return toStringValue(value) ?? defaultValue;
  }

  /// Convertit une valeur en bool avec une valeur par défaut
  static bool toBoolWithDefault(dynamic value, bool defaultValue) {
    return toBool(value) ?? defaultValue;
  }
}
