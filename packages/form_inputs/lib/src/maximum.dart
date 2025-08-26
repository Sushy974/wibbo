import 'package:formz/formz.dart';

/// Validation errors for the [Maximum] [FormzInput].
enum MaximumValidationError {
  /// Generic invalid error.
  invalid
}

///Genere le texte d'erreur
extension MaximumValidationText on MaximumValidationError {
  /// The error message to display to the user.
  String text() {
    switch (this) {
      case MaximumValidationError.invalid:
        return '''the value is greater than the maximum allowed''';
    }
  }
}

/// {@template Maximum}
/// Form input for an Maximum input.
/// {@endtemplate}
class Maximum extends FormzInput<int?, MaximumValidationError> {
  /// {@macro Maximum}
  const Maximum.pure({this.refValue = 0}) : super.pure(null);

  /// {@macro Maximum}
  const Maximum.dirty({
    required this.refValue,
    required int? value,
  }) : super.dirty(value);

  /// {@macro Maximum}
  final int refValue;

  @override
  MaximumValidationError? validator(int? value) {
    if (value == null) return MaximumValidationError.invalid;
    if (value > refValue) return MaximumValidationError.invalid;
    return null;
  }
}
