// ignore_for_file: doc_directive_missing_closing_brace

import 'package:formz/formz.dart';

/// Validation errors for the [DelaiEstimeLivraison] [FormzInput].
enum DelaiEstimeLivraisonValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template DelaiEstimeLivraison}
/// Form input for an DelaiEstimeLivraison input.
/// {@endtemplate}
class DelaiEstimeLivraisonInput
    extends FormzInput<int, DelaiEstimeLivraisonValidationError> {
  /// {@macro adresse}
  const DelaiEstimeLivraisonInput.pure() : super.pure(0);

  /// {@macro adresse
  const DelaiEstimeLivraisonInput.dirty([super.value = 0]) : super.dirty();

  // static final RegExp _adresseRegExp = RegExp(
  //   r'^\d+\s[a-zA-ZÀ-ÖØ-öø-ÿ\- ]+$',
  // );

  @override
  DelaiEstimeLivraisonValidationError? validator(int? value) {
    if (value == null || value <= 0) {
      return DelaiEstimeLivraisonValidationError.invalid;
    }

    return null;
  }
}
