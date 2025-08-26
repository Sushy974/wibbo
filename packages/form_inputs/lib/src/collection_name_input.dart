import 'package:formz/formz.dart';

enum CollectionNameValidationError { empty }

extension CollectionNameValidationErrorText on CollectionNameValidationError {
  String text() {
    switch (this) {
      case CollectionNameValidationError.empty:
        return '''Le nom de la collection ne peut pas être vide''';
    }
  }
}

class CollectionNameInput
    extends FormzInput<String, CollectionNameValidationError> {
  const CollectionNameInput.pure() : super.pure('');
  const CollectionNameInput.dirty([super.value = '']) : super.dirty();

  @override
  CollectionNameValidationError? validator(String? value) {
    return (value == null || value.trim().isEmpty)
        ? CollectionNameValidationError.empty
        : null;
  }
}
