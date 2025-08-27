// ignore_for_file: public_member_api_docs

import 'package:formz/formz.dart';

/// Validation errors for the [RechercheInput] [FormzInput].
enum RechercheInputValidationError {
  /// Generic invalid error.
  invalid,

  /// required
  obligatoire,
}


/// {@template RechercheInput}
/// Form input for an RechercheInput input.
/// {@endtemplate}
class RechercheInput
    extends FormzInput<String?, RechercheInputValidationError> {
  /// {@macro RechercheInput}
  const RechercheInput.dirty([super.value]) : super.dirty();
  const RechercheInput.pure() : super.pure(null);

  static final searchRegex = RegExp(r'^[a-zA-Z0-9\s\-_\.]*$');

  @override
  RechercheInputValidationError? validator(String? value) {
    if (!searchRegex.hasMatch(value ?? '')){
      return RechercheInputValidationError.invalid;
    }

    return value == '' || value == null
        ? RechercheInputValidationError.obligatoire
        : null;
  }
}
