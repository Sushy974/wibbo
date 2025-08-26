import 'package:formz/formz.dart';

/// Validation errors for the [ConfirmedPassword] [FormzInput].
enum ConfirmeMotDePasseValidationError {
  /// Generic invalid error.
  invalid,
  obligatoire,
}

/// {@template confirmed_password}
/// Form input for a confirmed password input.
/// {@endtemplate}
class ConfirmeMotDePasseInput
    extends FormzInput<String, ConfirmeMotDePasseValidationError> {
  /// {@macro confirmed_password}
  const ConfirmeMotDePasseInput.pure({this.motDePasse = ''}) : super.pure('');

  /// {@macro confirmed_password}
  const ConfirmeMotDePasseInput.dirty({
    required this.motDePasse,
    String value = '',
  }) : super.dirty(value);

  /// The original password.
  final String motDePasse;

  @override
  ConfirmeMotDePasseValidationError? validator(String? value) {
    // if (motDePasse.isEmpty) {
    //   return ConfirmeMotDePasseValidationError.obligatoire;
    // }
    return motDePasse == value
        ? null
        : ConfirmeMotDePasseValidationError.invalid;
  }
}
