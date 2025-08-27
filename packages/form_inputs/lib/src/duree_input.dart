// ignore_for_file: doc_directive_missing_closing_brace

import 'package:formz/formz.dart';

/// Validation errors for the [DureeInput] [FormzInput].
enum DureeInputValidationError {
  /// Generic invalid error.
  invalid
}

/// Mise en forme de l'erreur
extension DureeInputValidationErrorText on DureeInputValidationError {
  /// Retourne le message d'erreur
  String text() {
    switch (this) {
      case DureeInputValidationError.invalid:
        return '''L'DureeInput n'est pas valide''';
    }
  }
}

/// {@template DureeInput}
/// Form input for an DureeInput input.
/// {@endtemplate}
class DureeInputInput extends FormzInput<Duration?, DureeInputValidationError> {
  /// {@macro DureeInput}
  const DureeInputInput.pure() : super.pure(null);

  /// {@macro DureeInput
  const DureeInputInput.dirty([super.value]) : super.dirty();

  // static final RegExp _DureeInputRegExp = RegExp(
  //   r'^\d+\s[a-zA-ZÀ-ÖØ-öø-ÿ\- ]+$',
  // );

  @override
  DureeInputValidationError? validator(Duration? value) {
    if (value == null) return DureeInputValidationError.invalid;
    if (value == Duration.zero) return DureeInputValidationError.invalid;

    return null;
    // return _DureeInputRegExp.hasMatch(value ?? '')
    //     ? null
    //     : DureeInputValidationError.invalid;
  }
}
