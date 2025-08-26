import 'package:formz/formz.dart';

/// Validation errors for the [Email] [FormzInput].
enum NouvelleEmailValidationError {
  /// Generic invalid error.
  invalid,
  nonDisponible,
}

/// Mise en forme de l'erreur
extension NouvelleEmailValidationErrorText on NouvelleEmailValidationError {
  /// Retourne le message d'erreur
  String text() {
    switch (this) {
      case NouvelleEmailValidationError.invalid:
        return '''Email is not valid''';
      case NouvelleEmailValidationError.nonDisponible:
        return '''Email is not available''';
    }
  }
}

/// {@template email}
/// Form input for an email input.
/// {@endtemplate}
class NouvelleEmailInput
    extends FormzInput<String, NouvelleEmailValidationError> {
  /// {@macro email}
  const NouvelleEmailInput.pure({this.disponible = true}) : super.pure('');

  /// {@macro email}
  const NouvelleEmailInput.dirty({required this.disponible, String value = ''})
      : super.dirty(value);

  /// Indique si l'email est disponible
  final bool disponible;

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)+$',
  );

  @override
  NouvelleEmailValidationError? validator(String? value) {
    if (!disponible) {
      return NouvelleEmailValidationError.nonDisponible;
    }
    return _emailRegExp.hasMatch(value ?? '')
        ? null
        : NouvelleEmailValidationError.invalid;
  }
}
