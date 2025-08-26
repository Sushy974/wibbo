// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

/// Validation errors for the [Liste] [FormzInput].
enum ListeValidationError {
  /// Generic invalid error.
  invalid,
  obligatoire,
}

/// Mise en forme de l'erreur
extension ListeValidationErrorText on ListeValidationError {
  /// Retourne le message d'erreur
  String text() {
    switch (this) {
      case ListeValidationError.invalid:
        return '''La liste n'est pas valide''';
      case ListeValidationError.obligatoire:
        return '''La liste est obligatoire''';
    }
  }
}

/// {@template Liste}
/// Form input for an Liste input.
/// {@endtemplate}
class Liste<T> extends FormzInput<List<T>, ListeValidationError>
    with EquatableMixin {
  const Liste.pure() : super.pure(const []);

  /// {@macro Liste}
  const Liste.dirty([super.value = const []]) : super.dirty();

  @override
  ListeValidationError? validator(List<T>? value) {
    if (value == null || value.isEmpty) {
      return ListeValidationError.obligatoire;
    }
    return null;
  }

  @override
  List<Object?> get props => [value];
}
