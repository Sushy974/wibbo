import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

/// Validation errors for the [Heure] [FormzInput].
enum HeureValidationError {
  /// Generic invalid error.
  invalid
}

/// Mise en forme de l'erreur
extension HeureValidationErrorText on HeureValidationError {
  /// Retourne le message d'erreur
  String text() {
    switch (this) {
      case HeureValidationError.invalid:
        return '''La Heure n'est pas valide''';
    }
  }
}

/// {@template Heure}
/// Form input for an Heure input.
/// {@endtemplate}
class HeureInput extends FormzInput<TimeOfDay?, HeureValidationError> {
  /// {@macro Heure}
  const HeureInput.pure() : super.pure(null);

  /// {@macro Heure}
  const HeureInput.dirty([super.value]) : super.dirty();

  @override
  HeureValidationError? validator(TimeOfDay? value) {
    return value != null ? null : HeureValidationError.invalid;
  }
}
