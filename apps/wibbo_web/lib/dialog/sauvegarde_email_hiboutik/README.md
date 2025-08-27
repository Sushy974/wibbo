# Dialog de Sauvegarde Email Hiboutik

Ce dialog permet de modifier l'email Hiboutik d'un utilisateur connecté.

## Fonctionnalités

- **Modification d'email** : Permet de changer l'email Hiboutik
- **Validation** : Vérifie que l'email est valide avant soumission
- **Feedback utilisateur** : Affiche des notifications de succès/erreur
- **Style cohérent** : Utilise le thème Aurora de l'application

## Architecture

### BLoC Pattern
- `SauvegardeEmailHiboutikBloc` : Gère la logique métier
- `SauvegardeEmailHiboutikEvent` : Définit les événements (changement email, soumission)
- `SauvegardeEmailHiboutikState` : Gère l'état (loading, success, failure)

### Flux de données
1. L'utilisateur ouvre le dialog avec l'email actuel
2. L'utilisateur modifie l'email dans le champ
3. La validation se fait en temps réel
4. À la soumission, le usecase met à jour la base de données
5. Le dialog se ferme automatiquement en cas de succès

## Utilisation

### Dans la page de profil
```dart
// L'email Hiboutik est rendu cliquable
_buildEditableInfoRow(
  context,
  'Email Hiboutik',
  compte.hiboutikEmail,
  onTap: () => _showEditEmailHiboutikDialog(context, compte),
),

// Méthode pour ouvrir le dialog
void _showEditEmailHiboutikDialog(BuildContext context, CompteUtilisateur compte) {
  SauvegardeEmailHiboutikDialog.show(
    context,
    currentEmail: compte.hiboutikEmail,
    uid: compte.idCompte,
  );
}
```

### Ouverture directe
```dart
SauvegardeEmailHiboutikDialog.show(
  context,
  currentEmail: 'email@actuel.com',
  uid: 'user_id',
);
```

## Validation

- L'email doit être au format valide (regex standard)
- Le champ est désactivé pendant la sauvegarde
- Les erreurs sont affichées en temps réel

## Gestion des erreurs

- En cas d'échec, un message d'erreur s'affiche
- Le dialog reste ouvert pour permettre une nouvelle tentative
- Les erreurs de validation sont affichées sous le champ

## Style visuel

Le dialog utilise le thème Aurora avec :
- Arrière-plan dégradé
- Champs de saisie stylisés
- Boutons avec couleurs cohérentes
- Animations de chargement
