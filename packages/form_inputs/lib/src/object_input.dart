// ignore_for_file: doc_directive_missing_closing_brace

import 'package:formz/formz.dart';

/// Validation errors for the [ObjectInput] [FormzInput].
enum ObjectValidationError {
  /// Generic invalid error.
  invalid
}

/// Mise en forme de l'erreur
extension ObjectValidationErrorText on ObjectValidationError {
  /// Retourne le message d'erreur
  String text() {
    switch (this) {
      case ObjectValidationError.invalid:
        return '''L'objet n'est pas valide''';
    }
  }
}

/// {@template ObjectInput}
/// Form input for an Object input.
/// {@endtemplate}
class ObjectInput<T> extends FormzInput<T?, ObjectValidationError> {
  /// {@macro ObjectInput}
  const ObjectInput.pure() : super.pure(null);

  /// {@macro ObjectInput}
  const ObjectInput.dirty([super.value]) : super.dirty();

  @override
  ObjectValidationError? validator(T? value) {
    if (value == null) {
      return ObjectValidationError.invalid;
    }

    return null;
  }
}
