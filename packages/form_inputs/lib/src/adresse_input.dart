// ignore_for_file: doc_directive_missing_closing_brace

import 'package:formz/formz.dart';

/// Validation errors for the [Adresse] [FormzInput].
enum AdresseValidationError {
  /// Generic invalid error.
  invalid
}

/// Mise en forme de l'erreur
extension AdresseValidationErrorText on AdresseValidationError {
  /// Retourne le message d'erreur
  String text() {
    switch (this) {
      case AdresseValidationError.invalid:
        return '''L'adresse n'est pas valide''';
    }
  }
}

/// {@template Adresse}
/// Form input for an Adresse input.
/// {@endtemplate}
class AdresseInput extends FormzInput<String, AdresseValidationError> {
  /// {@macro adresse}
  const AdresseInput.pure() : super.pure('');

  /// {@macro adresse
  const AdresseInput.dirty([super.value = '']) : super.dirty();

  // static final RegExp _adresseRegExp = RegExp(
  //   r'^\d+\s[a-zA-ZÀ-ÖØ-öø-ÿ\- ]+$',
  // );

  @override
  AdresseValidationError? validator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AdresseValidationError.invalid;
    }

    return null;
    // return _adresseRegExp.hasMatch(value ?? '')
    //     ? null
    //     : AdresseValidationError.invalid;
  }
}
