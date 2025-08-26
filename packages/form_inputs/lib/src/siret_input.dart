// ignore_for_file: public_member_api_docs

import 'package:formz/formz.dart';

/// Validation errors for the [Siret] [FormzInput].
enum SiretInputValidationError {
  /// Generic invalid error.
  invalid,

  /// required
  obligatoire,

  tailleDepasse,
}

extension SiretInputValidationErrorX on SiretInputValidationError {
  String? get text {
    switch (this) {
      case SiretInputValidationError.obligatoire:
        return 'Ce champ est obligatoire';
      case SiretInputValidationError.tailleDepasse:
        return 'Le nombre de caractères ne doit pas dépasser 14';
      case SiretInputValidationError.invalid:
        return 'Ce champ est invalid';
    }
  }
}

/// {@template Siret}
/// Form input for an Siret input.
/// {@endtemplate}
///
const int _tailleMax = 14;

class SiretInput extends FormzInput<String, SiretInputValidationError> {
  const SiretInput.pure() : super.pure('');

  /// {@macro Siret}
  const SiretInput.dirty([String? value = '']) : super.dirty(value ?? '');
  // static final RegExp _designationRegExp = RegExp(
  //   r'^[a-zA-Z0-9\-_\. ]+$',
  // );

  @override
  SiretInputValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return SiretInputValidationError.obligatoire;
    }

    if (value.length > _tailleMax) {
      return SiretInputValidationError.tailleDepasse;
    }

    return null;
  }
}
