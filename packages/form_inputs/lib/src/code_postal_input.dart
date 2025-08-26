// ignore_for_file: doc_directive_missing_closing_brace

import 'package:formz/formz.dart';

/// Validation errors for the [CodePostalInput] [FormzInput].
enum CodePostalInputValidationError {
  /// Generic invalid error.
  invalid,
  vide,

}

/// Mise en forme de l'erreur
extension CodePostalInputValidationErrorText on CodePostalInputValidationError {
  /// Retourne le message d'erreur
  String text() {
    switch (this) {
      case CodePostalInputValidationError.invalid:
        return '''L'CodePostalInput n'est pas valide''';
      case CodePostalInputValidationError.vide:
        return '''Le CodePostalInput ne peut pas être vide''';
    }
  }
}

/// {@template CodePostalInput}
/// Form input for an CodePostalInput input.
/// {@endtemplate}
class CodePostalInput
    extends FormzInput<String, CodePostalInputValidationError> {
  /// {@macro CodePostalInput}
  const CodePostalInput.pure() : super.pure('');

  /// {@macro CodePostalInput
  const CodePostalInput.dirty([super.value = '']) : super.dirty();

  static final RegExp _codePostalInputRegExp =  RegExp(r'^\d{4,8}$');

  @override
  CodePostalInputValidationError? validator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return CodePostalInputValidationError.vide;
    }
    if (!_codePostalInputRegExp.hasMatch(value)) {
      return CodePostalInputValidationError.invalid;
    }

    return null;
  }
}
