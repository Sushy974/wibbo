// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

/// Validation errors for the [Signature] [FormzInput].
enum SignatureValidationError {
  /// Generic invalid error.
  invalid,

  /// required
  obligatoire,
}

/// Mise en forme de l'erreur
extension SignatureValidationErrorText on SignatureValidationError {
  /// Retourne le message d'erreur
  String text() {
    switch (this) {
      case SignatureValidationError.invalid:
        return '''Le signature n'est pas valide''';
      case SignatureValidationError.obligatoire:
        return '''Le signature est obligatoire''';
    }
  }
}

/// {@template Signature}
/// Form input for an Signature input.
/// {@endtemplate}
class SignatureInput extends FormzInput<File?, SignatureValidationError>
    with EquatableMixin {
  const SignatureInput.pure() : super.pure(null);

  /// {@macro Signature}
  const SignatureInput.dirty([super.value]) : super.dirty();
  @override
  SignatureValidationError? validator(File? value) {
    if (value == null) {
      return SignatureValidationError.obligatoire;
    }
    return null;
  }

  @override
  List<Object?> get props => [value];
}
