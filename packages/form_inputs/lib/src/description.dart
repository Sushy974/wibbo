import 'package:formz/formz.dart';

/// Errors for the [DescriptionInput] FormzInput.
enum DescriptionValidationError { empty, tooShort, tooLong }

extension DescriptionValidationErrorText on DescriptionValidationError {
  String text() {
    switch (this) {
      case DescriptionValidationError.empty:
        return 'Description cannot be empty';
      case DescriptionValidationError.tooShort:
        return 'Description is too short';
      case DescriptionValidationError.tooLong:
        return 'Description is too long';
    }
  }
}

/// Form input for a description.
class DescriptionInput extends FormzInput<String, DescriptionValidationError> {
  const DescriptionInput.pure() : super.pure('');

  const DescriptionInput.dirty([super.value = '']) : super.dirty();

  static const int minLength = 10;
  static const int maxLength = 500;

  @override
  DescriptionValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return DescriptionValidationError.empty;
    }
    if (value.length < minLength) {
      return DescriptionValidationError.tooShort;
    }
    if (value.length > maxLength) {
      return DescriptionValidationError.tooLong;
    }
    return null;
  }
}
