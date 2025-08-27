import 'package:formz/formz.dart';

/// Validation errors for the [RaisonSocialeInput] [FormzInput].
enum RaisonSocialeValidationError {
  /// Generic invalid error.
  empty,
}

/// Mise en forme de l'erreur
extension RaisonSocialeValidationErrorText on RaisonSocialeValidationError {
  /// Retourne le message d'erreur
  String text() {
    switch (this) {
      case RaisonSocialeValidationError.empty:
        return '''La raison sociale ne peut pas être vide.''';
    }
  }
}

/// {@template company_name}
/// Form input for a company name input.
/// {@endtemplate}
class RaisonSocialeInput
    extends FormzInput<String, RaisonSocialeValidationError> {
  /// {@macro company_name}
  const RaisonSocialeInput.pure() : super.pure('');

  /// {@macro company_name}
  const RaisonSocialeInput.dirty([super.value = '']) : super.dirty();

  @override
  RaisonSocialeValidationError? validator(String? value) {
    return (value?.isNotEmpty ?? false)
        ? null
        : RaisonSocialeValidationError.empty;
  }
}
