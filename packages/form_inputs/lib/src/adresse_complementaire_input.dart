// ignore_for_file: doc_directive_missing_closing_brace

import 'package:formz/formz.dart';

/// Validation errors for the [Adresse] [FormzInput].
enum AdresseComplementaireValidationError {
  /// Generic invalid error.
  invalid
}

/// Mise en forme de l'erreur
extension AdresseComplementaireValidationErrorText on AdresseComplementaireValidationError {
  /// Retourne le message d'erreur
  String text() {
    switch (this) {
      case AdresseComplementaireValidationError.invalid:
        return '''L'adresse n'est pas valide''';
    }
  }
}

/// {@template Adresse}
/// Form input for an Adresse input.
/// {@endtemplate}
class AdresseComplementaireInput extends FormzInput<String, AdresseComplementaireValidationError> {
  /// {@macro adresse}
  const AdresseComplementaireInput.pure() : super.pure('');

  /// {@macro adresse
  const AdresseComplementaireInput.dirty([super.value = '']) : super.dirty();

  // static final RegExp _adresseRegExp = RegExp(
  //   r'^\d+\s[a-zA-ZÀ-ÖØ-öø-ÿ\- ]+$',
  // );

  @override
  AdresseComplementaireValidationError? validator(String? value) {
   
    return null;
    // return _adresseRegExp.hasMatch(value ?? '')
    //     ? null
    //     : AdresseValidationError.invalid;
  }
}
