import 'package:formz/formz.dart';

/// Validation errors for the [Date] [FormzInput].
enum DateValidationError {
  /// Generic invalid error.
  invalid
}

/// Mise en forme de l'erreur
extension DateValidationErrorText on DateValidationError {
  /// Retourne le message d'erreur
  String text() {
    switch (this) {
      case DateValidationError.invalid:
        return '''La date n'est pas valide''';
    }
  }
}

/// {@template Date}
/// Form input for an Date input.
/// {@endtemplate}
class DateInput extends FormzInput<DateTime?, DateValidationError> {
  /// {@macro Date}
  const DateInput.pure() : super.pure(null);

  /// {@macro Date}
  const DateInput.dirty([super.value]) : super.dirty();

  // static final RegExp _dateRegExp = RegExp(
  //   r'^[12]\d{3}-(0[1-9]|1[012])-(0[1-9]|[12]\d|3[01])$',
  // );

  @override
  DateValidationError? validator(DateTime? value) {
    return value != null ? null : DateValidationError.invalid;
  }
}
