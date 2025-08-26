// ignore_for_file: public_member_api_docs

import 'package:formz/formz.dart';

/// Validation errors for the [Nom] [FormzInput].
enum NomValidationError {
  /// Generic invalid error.
  invalid,

  /// required
  obligatoire,
}

/// Mise en forme de l'erreur
extension NomValidationErrorText on NomValidationError {
  /// Retourne le message d'erreur
  String text() {
    switch (this) {
      case NomValidationError.invalid:
        return '''Le nom n'est pas valide''';
      case NomValidationError.obligatoire:
        return '''Le nom est obligatoire''';
    }
  }
}

/// {@template Nom}
/// Form input for an Nom input.
/// {@endtemplate}
class NomInput extends FormzInput<String, NomValidationError> {
  const NomInput.pure() : super.pure('');

  /// {@macro Nom}
  const NomInput.dirty([super.value = '']) : super.dirty();
  static final RegExp _nomRegExp = RegExp(
    r'^[a-zA-ZÀ-ÖØ-öø-ÿ\- ]+$',
  );
  @override
  NomValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return NomValidationError.obligatoire;
    }
    return _nomRegExp.hasMatch(value) ? null : NomValidationError.invalid;
  }
}
