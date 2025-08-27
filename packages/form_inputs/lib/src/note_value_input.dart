import 'package:formz/formz.dart';

/// Erreurs possibles de validation pour une note (valeur entière).
enum NoteValueValidationError {
  /// La note est inférieure ou égale à zéro.
  tropPetite,

  /// La note est supérieure à 5.
  tropGrande,
}

/// Extension pour obtenir un message d'erreur lisible à partir de [NoteValueValidationError].
extension NoteValueValidationErrorText on NoteValueValidationError {
  /// Retourne un message d'erreur lisible pour l'utilisateur.
  String text() {
    switch (this) {
      case NoteValueValidationError.tropPetite:
        return 'La note doit être supérieure à 0';
      case NoteValueValidationError.tropGrande:
        return 'La note ne peut pas dépasser 5';
    }
  }
}

/// {@template note_value_input}
/// Champ de formulaire pour une note (valeur entière).
/// Valide que la note est strictement > 0 et <= 5.
/// {@endtemplate}
class NoteValueInput extends FormzInput<int, NoteValueValidationError> {
  /// {@macro note_value_input}
  const NoteValueInput.pure() : super.pure(0);

  /// {@macro note_value_input}
  const NoteValueInput.dirty([super.value = 0]) : super.dirty();

  /// Retourne une erreur si la note est inférieure ou égale à 0, ou supérieure à 5.
  @override
  NoteValueValidationError? validator(int value) {
    if (value <= 0) return NoteValueValidationError.tropPetite;
    if (value > 5) return NoteValueValidationError.tropGrande;
    return null;
  }
}
