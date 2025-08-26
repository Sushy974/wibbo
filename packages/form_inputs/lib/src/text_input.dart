// ignore_for_file: public_member_api_docs

import 'package:formz/formz.dart';

/// Validation errors for the [TextInput] [FormzInput].
enum TextInputValidationError {
  /// Generic invalid error.
  invalid,

  /// required
  obligatoire,
}

/// Mise en forme de l'erreur
extension TextInputValidationErrorText on TextInputValidationError {
  /// Retourne le message d'erreur
  String text() {
    switch (this) {
      case TextInputValidationError.invalid:
        return '''Le nom n'est pas valide''';
      case TextInputValidationError.obligatoire:
        return '''Le nom est obligatoire''';
    }
  }
}

/// {@template TextInput}
/// Form input for an TextInput input.
/// {@endtemplate}
class TextInput extends FormzInput<String?, TextInputValidationError> {
  const TextInput.pure() : super.pure(null);

  /// {@macro TextInput}
  const TextInput.dirty([super.value]) : super.dirty();

  @override
  TextInputValidationError? validator(String? value) {
    return value == '' || value == null
        ? TextInputValidationError.obligatoire
        : null;
  }
}
