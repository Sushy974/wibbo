// ignore_for_file: public_member_api_docs

import 'package:formz/formz.dart';

/// Validation errors for the [Prenom] [FormzInput].
enum PrenomValidationError {
  /// Generic invalid error.
  invalid,

  /// required
  obligatoire,
}

/// Mise en forme de l'erreur
extension PrenomValidationErrorText on PrenomValidationError {
  /// Retourne le message d'erreur
  String text() {
    switch (this) {
      case PrenomValidationError.invalid:
        return '''Le prénom n'est pas valide''';
      case PrenomValidationError.obligatoire:
        return '''Le prénom est obligatoire''';
    }
  }
}

/// {@template Prenom}
/// Form input for an Prenom input.
/// {@endtemplate}
class PrenomInput extends FormzInput<String, PrenomValidationError> {
  const PrenomInput.pure() : super.pure('');

  /// {@macro Prenom}
  const PrenomInput.dirty([super.value = '']) : super.dirty();
  static final RegExp _prenomRegExp = RegExp(
    r'^[a-zA-ZÀ-ÖØ-öø-ÿ\- ]+$',
  );
  @override
  PrenomValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return PrenomValidationError.obligatoire;
    }
    return _prenomRegExp.hasMatch(value) ? null : PrenomValidationError.invalid;
  }
}
