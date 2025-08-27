import 'package:formz/formz.dart';

/// Validation errors for the [Heure] [FormzInput].
enum HeureValidationError {
  /// Generic invalid error.
  invalid
}

/// Mise en forme de l'erreur
extension HeureValidationErrorText on HeureValidationError {
  /// Retourne le message d'erreur
  String text() {
    switch (this) {
      case HeureValidationError.invalid:
        return '''L'heure n'est pas valide''';
    }
  }
}

/// {@template Heure}
/// Form input for an Heure input.
/// {@endtemplate}
class Heure extends FormzInput<String, HeureValidationError> {
  /// {@macro Heure}
  const Heure.pure() : super.pure('');

  /// {@macro Heure}
  const Heure.dirty([super.value = '']) : super.dirty();

  static final RegExp _heureRegExp = RegExp(
    r'^(0\d|1\d|2[0-3]):[0-5]\d$',
  );

  @override
  HeureValidationError? validator(String? value) {
    return _heureRegExp.hasMatch(value ?? '')
        ? null
        : HeureValidationError.invalid;
  }
}
