import 'package:formz/formz.dart';

enum TelephoneNumberValidationError {
  invalid,
  incomplete,
}

extension TelephoneNumberValidationErrorText on TelephoneNumberValidationError {
  String text() {
    switch (this) {
      case TelephoneNumberValidationError.invalid:
        return '''Le numéro de téléphone doit contenir exactement 10 chiffres.''';
      case TelephoneNumberValidationError.incomplete:
        return '''Le numéro de téléphone doit contenir exactement 10 chiffres.''';
    }
  }
}

class TelephoneNumberInput
    extends FormzInput<String, TelephoneNumberValidationError> {
  const TelephoneNumberInput.pure() : super.pure('');
  const TelephoneNumberInput.dirty([super.value = '']) : super.dirty();

  @override
  TelephoneNumberValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return TelephoneNumberValidationError.incomplete;
    }

    final cleaned = value.replaceAll(RegExp(r'\s+'), '');
    if (RegExp(r'^\d{10}$').hasMatch(cleaned)) {
      return null;
    }
    return TelephoneNumberValidationError.invalid;
  }
}
