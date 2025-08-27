// ignore_for_file: public_member_api_docs

import 'package:formz/formz.dart';

/// Validation errors for the [Designation] [FormzInput].
enum DesignationInputValidationError {
  /// Generic invalid error.
  invalid,

  /// required
  obligatoire,
}

/// Mise en forme de l'erreur
extension DesignationValidationErrorText on DesignationInputValidationError {
  /// Retourne le message d'erreur
  String text() {
    switch (this) {
      case DesignationInputValidationError.invalid:
        return '''La designation n'est pas valide''';
      case DesignationInputValidationError.obligatoire:
        return '''La designation est obligatoire''';
    }
  }
}

/// {@template Designation}
/// Form input for an Designation input.
/// {@endtemplate}
class DesignationInput
    extends FormzInput<String, DesignationInputValidationError> {
  const DesignationInput.pure() : super.pure('');

  /// {@macro Designation}
  const DesignationInput.dirty([String? value = '']) : super.dirty(value ?? '');
  // static final RegExp _designationRegExp = RegExp(
  //   r'^[a-zA-Z0-9\-_\. ]+$',
  // );
  @override
  DesignationInputValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return DesignationInputValidationError.obligatoire;
    }

    return null;
  }
}
