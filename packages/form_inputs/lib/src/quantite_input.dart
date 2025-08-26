import 'package:formz/formz.dart';

/// Validation errors for the [QuantiteInput] [FormzInput].
enum QuantiteValidationError { invalid }

/// {@template quantite}
/// Form input for a Quantite input.
/// {@endtemplate}
///
/// Mise en forme de l'erreur
extension QuantiteValidationErrorText on QuantiteValidationError {
  /// Retourne le message d'erreur
  String text() {
    return 'La quantité doit être supérieure à 0';
  }
}
class QuantiteInput extends FormzInput<int?, QuantiteValidationError> {
  /// {@macro quantite}
  const QuantiteInput.pure() : super.pure(null);

  /// {@macro quantite}
  const QuantiteInput.dirty([super.value]) : super.dirty();

  @override
  QuantiteValidationError? validator(int? value) {
    if (value == null || value <= 0) {
      return QuantiteValidationError.invalid;
    }
    return null;
  }
}
