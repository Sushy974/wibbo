import 'package:formz/formz.dart';

/// Erreurs possibles de validation pour le champ Commentaire.
enum CommentaireValidationError {
  /// Le commentaire est vide.
  vide,
}

/// Extension pour obtenir un message d'erreur lisible à partir de [CommentaireValidationError].
extension CommentaireValidationErrorText on CommentaireValidationError {
  /// Retourne le message d'erreur correspondant.
  String text() {
    switch (this) {
      case CommentaireValidationError.vide:
        return 'Le commentaire ne peut pas être vide';
    }
  }
}

/// {@template commentaire_input}
/// Représente un champ de formulaire pour un commentaire utilisateur.
/// Valide que le commentaire n'est pas vide.
/// {@endtemplate}
class CommentaireInput extends FormzInput<String, CommentaireValidationError> {
  /// {@macro commentaire_input}
  const CommentaireInput.pure() : super.pure('');

  /// {@macro commentaire_input}
  const CommentaireInput.dirty([super.value = '']) : super.dirty();

  /// Validation : retourne une erreur si le commentaire est vide ou contient uniquement des espaces.
  @override
  CommentaireValidationError? validator(String value) {
    return value
        .trim()
        .isNotEmpty ? null : CommentaireValidationError.vide;
  }
}
