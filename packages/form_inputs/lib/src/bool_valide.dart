// ignore_for_file: public_member_api_docs

import 'package:formz/formz.dart';

/// Validation errors for the [BoolValide] [FormzInput].
enum BoolValideValidationError {
  /// Generic invalid error.
  invalid,

  /// required
  obligatoire,
}

/// Mise en forme de l'erreur
extension BoolValideValidationErrorText on BoolValideValidationError {
  /// Retourne le message d'erreur
  String text() {
    switch (this) {
      case BoolValideValidationError.invalid:
        return '''Pas valide''';
      case BoolValideValidationError.obligatoire:
        return '''Est obligatoire''';
    }
  }
}

/// {@template BoolValide}
/// Form input for an BoolValide input.
/// {@endtemplate}
class BoolValide extends FormzInput<bool, BoolValideValidationError> {
  const BoolValide.pure() : super.pure(true);

  /// {@macro BoolValide}
  // ignore: avoid_positional_boolean_parameters
  const BoolValide.dirty([super.value = true]) : super.dirty();

  @override
  BoolValideValidationError? validator(bool? value) {
    if (value == null || value == false) {
      return BoolValideValidationError.obligatoire;
    }
    return null;
  }
}
