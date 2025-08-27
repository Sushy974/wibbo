import 'package:formz/formz.dart';

/// Validation errors for the [VilleInput] [FormzInput].
enum VilleInputValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template VilleInput}
/// Form input for an VilleInput input.
/// {@endtemplate}
class VilleInput extends FormzInput<String, VilleInputValidationError> {
  /// {@macro VilleInput}
  const VilleInput.pure() : super.pure('');

  /// {@macro VilleInput}
  const VilleInput.dirty([super.value = '']) : super.dirty();

  @override
  VilleInputValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return VilleInputValidationError.invalid;
    }

    return null;
  }
}
