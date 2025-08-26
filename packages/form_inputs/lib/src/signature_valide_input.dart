// ignore_for_file: public_member_api_docs

import 'package:formz/formz.dart';

/// Validation errors for the [SignatureValideInput] [FormzInput].
enum SignatureValideInputValidationError {
  /// Generic invalid error.
  invalid,

  /// required
  obligatoire,
}

/// Mise en forme de l'erreur
extension SignatureValideInputValidationErrorText
    on SignatureValideInputValidationError {
  /// Retourne le message d'erreur
  String text() {
    switch (this) {
      case SignatureValideInputValidationError.invalid:
        return '''Le signature n'est pas valide''';
      case SignatureValideInputValidationError.obligatoire:
        return '''Le signature est obligatoire''';
    }
  }
}

/// {@template SignatureValideInput}
/// Form input for an SignatureValideInput input.
/// {@endtemplate}
class SignatureValideInput
    extends FormzInput<bool, SignatureValideInputValidationError> {
  const SignatureValideInput.pure() : super.pure(false);

  /// {@macro SignatureValideInput}
  // ignore: avoid_positional_boolean_parameters
  const SignatureValideInput.dirty([super.value = false]) : super.dirty();

  @override
  SignatureValideInputValidationError? validator(bool? value) {
    if (value == null || value == false) {
      return SignatureValideInputValidationError.obligatoire;
    }
    return null;
  }
}
