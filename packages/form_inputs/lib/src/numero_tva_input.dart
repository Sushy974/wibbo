// ignore_for_file: public_member_api_docs

import 'package:formz/formz.dart';

/// Validation errors for the [NumeroTva] [FormzInput].
enum NumeroTvaInputValidationError {
  /// Generic invalid error.
  invalid,

  /// required
  obligatoire,
}

extension NumeroTvaInputValidationErrorText on NumeroTvaInputValidationError {
  /// Retourne le message d'erreur
  String text() {
    switch (this) {
      case NumeroTvaInputValidationError.invalid:
        return '''Le numéro de TVA n'est pas valide''';
      case NumeroTvaInputValidationError.obligatoire:
        return '''Le numéro de TVA est obligatoire''';
    }
  }
}

/// {@template NumeroTva}
/// Form input for an NumeroTva input.
/// {@endtemplate}
class NumeroTvaInput extends FormzInput<String, NumeroTvaInputValidationError> {
  const NumeroTvaInput.pure() : super.pure('');

  /// {@macro NumeroTva}
  const NumeroTvaInput.dirty([String? value = '']) : super.dirty(value ?? '');
  // static final RegExp _designationRegExp = RegExp(
  //   r'^[a-zA-Z0-9\-_\. ]+$',
  // );
  @override
  NumeroTvaInputValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return NumeroTvaInputValidationError.obligatoire;
    }

    return null;
  }
}
