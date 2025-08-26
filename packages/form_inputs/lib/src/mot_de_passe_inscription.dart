import 'package:formz/formz.dart';

/// Validation errors for the [Password] [FormzInput].
enum MotDePasseInscriptionValidationError {
  /// Generic invalid error.
  invalid
}

///Genere le texte d'erreur
extension MotDePasseInscriptionValidationText
    on MotDePasseInscriptionValidationError {
  /// The error message to display to the user.
  String text() {
    switch (this) {
      case MotDePasseInscriptionValidationError.invalid:
        return '''Password must contain at least 8 characters, and include at least one letter, one number, and one special character.''';
    }
  }
}

/// {@template password}
/// Form input for an password input.
/// {@endtemplate}
class MotDePasseInscription
    extends FormzInput<String, MotDePasseInscriptionValidationError> {
  /// {@macro password}
  const MotDePasseInscription.pure() : super.pure('');

  /// {@macro password}
  const MotDePasseInscription.dirty([super.value = '']) : super.dirty();

  static final _motDePasseRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&+#])[A-Za-z\d@$!%*?&+#]{8,}$',
  );

  @override
  MotDePasseInscriptionValidationError? validator(String? value) {
    return _motDePasseRegExp.hasMatch(value ?? '')
        ? null
        : MotDePasseInscriptionValidationError.invalid;
  }
}
