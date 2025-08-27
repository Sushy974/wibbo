# Usecases de Sauvegarde

Ce dossier contient tous les usecases pour la sauvegarde des différents champs du profil utilisateur.

## Usecases Disponibles

### Configuration Hiboutik

#### 1. Sauvegarde Email Hiboutik
- **Fichier** : `sauvegarde_email_hiboutik_usecase.dart`
- **Classe** : `SauvegardeEmailHiboutikUsecase`
- **Commande** : `SauvegardeEmailHiboutikCommand`
- **Fonction** : Met à jour l'email Hiboutik d'un utilisateur

#### 2. Sauvegarde API Key Hiboutik
- **Fichier** : `sauvegarde_api_key_hiboutik_usecase.dart`
- **Classe** : `SauvegardeApiKeyHiboutikUsecase`
- **Commande** : `SauvegardeApiKeyHiboutikCommand`
- **Fonction** : Met à jour l'API key Hiboutik d'un utilisateur

#### 3. Sauvegarde URL Hiboutik
- **Fichier** : `sauvegarde_url_hiboutik_usecase.dart`
- **Classe** : `SauvegardeUrlHiboutikUsecase`
- **Commande** : `SauvegardeUrlHiboutikCommand`
- **Fonction** : Met à jour l'URL Hiboutik d'un utilisateur

#### 4. Sauvegarde ID Vendeur Hiboutik
- **Fichier** : `sauvegarde_id_vendeur_hiboutik_usecase.dart`
- **Classe** : `SauvegardeIdVendeurHiboutikUsecase`
- **Commande** : `SauvegardeIdVendeurHiboutikCommand`
- **Fonction** : Met à jour l'ID vendeur Hiboutik d'un utilisateur

### Configuration Wix

#### 5. Sauvegarde URL Wix
- **Fichier** : `sauvegarde_url_wix_usecase.dart`
- **Classe** : `SauvegardeUrlWixUsecase`
- **Commande** : `SauvegardeUrlWixCommand`
- **Fonction** : Met à jour l'URL Wix d'un utilisateur

#### 6. Sauvegarde Site ID Wix
- **Fichier** : `sauvegarde_site_id_wix_usecase.dart`
- **Classe** : `SauvegardeSiteIdWixUsecase`
- **Commande** : `SauvegardeSiteIdWixCommand`
- **Fonction** : Met à jour le Site ID Wix d'un utilisateur

#### 7. Sauvegarde API Key Wix
- **Fichier** : `sauvegarde_api_key_wix_usecase.dart`
- **Classe** : `SauvegardeApiKeyWixUsecase`
- **Commande** : `SauvegardeApiKeyWixCommand`
- **Fonction** : Met à jour l'API Key Wix d'un utilisateur

## Architecture

### Pattern Command
Chaque usecase suit le pattern Command avec :
- Une classe `Usecase` qui contient la logique métier
- Une classe `Command` qui encapsule les paramètres d'entrée
- Une méthode `execute()` qui prend une commande en paramètre

### Dépendances
Tous les usecases dépendent de :
- `CompteUtilisateurRepository` : Pour accéder aux données utilisateur

### Exemple d'utilisation

```dart
// Création du usecase
final usecase = SauvegardeEmailHiboutikUsecase(
  compteUtilisateurRepository: repository,
);

// Exécution
await usecase.execute(
  SauvegardeEmailHiboutikCommand(
    email: 'nouveau@email.com',
    uid: 'user_id',
  ),
);
```

## Validation

Chaque usecase :
1. Valide les paramètres d'entrée
2. Vérifie l'existence de l'utilisateur
3. Met à jour le champ spécifique
4. Gère les erreurs de manière appropriée

## Gestion des erreurs

Les erreurs communes incluent :
- Utilisateur non trouvé
- Paramètres invalides
- Erreurs de base de données

Chaque usecase lève des exceptions appropriées qui sont gérées par les BLoCs correspondants.

## Intégration avec les BLoCs

Ces usecases sont utilisés par les BLoCs des dialogs de modification :
- `SauvegardeEmailHiboutikBloc`
- `SauvegardeApiKeyHiboutikBloc`
- `SauvegardeUrlHiboutikBloc`
- etc.

## Tests

Chaque usecase devrait être testé pour :
- Cas de succès
- Cas d'erreur (utilisateur non trouvé)
- Validation des paramètres
- Intégration avec le repository
