// ignore_for_file: doc_directive_missing_closing_brace

import 'package:formz/formz.dart';

/// Validation errors for the [Telephone] [FormzInput].
enum TelephoneValidationError {
  /// Generic invalid error.
  invalid
}

/// Mise en forme de l'erreur
extension TelephoneValidationErrorText on TelephoneValidationError {
  /// Retourne le message d'erreur
  String text() {
    switch (this) {
      case TelephoneValidationError.invalid:
        return '''L'Telephone n'est pas valide''';
    }
  }
}

/// {@template Telephone}
/// Form input for an Telephone input.
/// {@endtemplate}
class TelephoneInput extends FormzInput<String, TelephoneValidationError> {
  /// {@macro Telephone}
  const TelephoneInput.pure() : super.pure('');

  /// {@macro Telephone
  const TelephoneInput.dirty([String? value = '']) : super.dirty(value ?? '');

  static final RegExp _telephoneRegExp = RegExp(
    r'^\+?[0-9\s\-\(\)]{7,15}$',
  );

  @override
  TelephoneValidationError? validator(String? value) {
    if (_telephoneRegExp.hasMatch(value ?? '')) {
      return null;
    }

    return TelephoneValidationError.invalid;
  }
}
