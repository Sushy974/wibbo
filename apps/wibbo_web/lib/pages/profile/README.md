# Page de Profil

Cette page affiche toutes les informations du profil utilisateur connecté en utilisant le pattern BLoC.

## Fonctionnalités

- **Affichage des informations générales** : ID compte, email, dates de création et validité
- **Configuration Hiboutik** : Email, mot de passe (masqué), URL, ID vendeur, webhooks
- **Configuration Wix** : URL, Site ID, API Key (masquée), webhook
- **Copie des webhooks** : Bouton de copie pour tous les webhooks
- **Édition des champs** : Tous les champs sont maintenant modifiables via des dialogs
- **Déconnexion** : Bouton de déconnexion dans l'AppBar avec confirmation

## Champs Modifiables

### Configuration Hiboutik
- **Email Hiboutik** : Utilise le dialog spécialisé avec validation email
- **Mot de passe Hiboutik** : Champ masqué avec validation de mot de passe
- **URL Hiboutik** : Validation d'URL
- **ID Vendeur Hiboutik** : Champ texte simple

### Configuration Wix
- **URL Wix** : Validation d'URL
- **Site ID Wix** : Champ texte simple
- **API Key Wix** : Champ texte masqué pour la sécurité

## Architecture

### BLoC Pattern
- `ProfileBloc` : Gère la logique métier et la récupération des données
- `ProfileEvent` : Définit les événements (stream utilisateur, chargement compte)
- `ProfileState` : Gère l'état (loading, success, failure)

### Flux de données
1. L'utilisateur se connecte via `AuthenticationRepository`
2. Le `ProfileBloc` écoute les changements d'utilisateur connecté
3. Quand un utilisateur est connecté, le BLoC récupère le `CompteUtilisateur` correspondant
4. La vue affiche toutes les informations du profil
5. L'utilisateur peut modifier n'importe quel champ via des dialogs

### Dialogs d'édition
- **Dialogs spécialisés** : Chaque champ modifiable a son propre dialog avec BLoC dédié
- **Style cohérent** : Tous les dialogs utilisent le thème Aurora
- **Validation** : Chaque type de champ a sa propre validation
- **Architecture** : Chaque dialog suit le pattern BLoC avec événements, état et logique métier

## Dialogs Créés

### Configuration Hiboutik
1. **SauvegardeEmailHiboutik** - Déjà existant
2. **SauvegardeMotDePasseHiboutik** - Nouveau
3. **SauvegardeUrlHiboutik** - Nouveau
4. **SauvegardeIdVendeurHiboutik** - Nouveau

### Configuration Wix
5. **SauvegardeUrlWix** - Nouveau
6. **SauvegardeSiteIdWix** - Nouveau
7. **SauvegardeApiKeyWix** - Nouveau

Chaque dialog suit la même structure :
- `bloc/` - Événements, état et logique BLoC
- `view/` - Page (BlocProvider) et Vue (interface)
- `sauvegarde_*.dart` - Fichier d'index pour l'export

## Utilisation

### Modification d'un champ
1. Cliquer sur le champ à modifier (il apparaît avec une bordure et une icône d'édition)
2. Le dialog s'ouvre avec la valeur actuelle pré-remplie
3. Modifier la valeur dans le champ
4. Cliquer sur "Sauvegarder" pour confirmer ou "Annuler" pour fermer

### Copie des webhooks
1. Cliquer sur l'icône de copie à côté du webhook
2. Une notification confirme que le webhook a été copié dans le presse-papiers

### Déconnexion
1. Cliquer sur le bouton "Se déconnecter" dans l'AppBar
2. Confirmer la déconnexion dans le dialog
3. L'utilisateur est redirigé vers la page de connexion

## Validation des champs

- **Email** : Format email standard
- **Mot de passe** : Minimum 8 caractères avec lettres, chiffres et caractères spéciaux
- **URL** : Format URL valide
- **ID** : Champ texte sans validation spéciale
- **API Key** : Champ texte sans validation spéciale

## Sécurité

- Les mots de passe et API keys sont masqués par défaut
- Seuls les utilisateurs connectés peuvent accéder à cette page
- Chaque modification nécessite une confirmation
- Les erreurs sont affichées de manière claire à l'utilisateur

## Style visuel

La page utilise le thème Aurora avec :
- Arrière-plan dégradé
- Cartes stylisées avec ombres
- Couleurs cohérentes (vert principal, blanc, fond d'input)
- Typographie claire et lisible
- Espacement harmonieux entre les éléments
