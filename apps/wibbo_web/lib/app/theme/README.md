# Thème Aurora - Documentation

## 🎨 Vue d'ensemble

Le thème Aurora est un thème Flutter personnalisé inspiré des aurores boréales, offrant un design moderne et cohérent pour toute l'application.

## 🚀 Utilisation rapide

### 1. Application du thème global

Le thème est automatiquement appliqué dans `app/view/app.dart` :

```dart
MaterialApp(
  theme: AuroraTheme.theme,
  // ...
)
```

### 2. Utilisation dans une page

```dart
import 'package:wibbo_web/app/theme/theme.dart';

class MaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuroraTheme.auroraBackground(
        child: // Votre contenu ici
      ),
    );
  }
}
```

## 🎯 Composants disponibles

### Arrière-plan avec aurores boréales

```dart
AuroraTheme.auroraBackground(
  child: // Votre contenu
  showStars: true, // Optionnel, par défaut true
  showMountains: true, // Optionnel, par défaut true
)
```

### Champs de saisie stylisés

```dart
AuroraTheme.auroraInputField(
  context: context,
  icon: Icons.person,
  hintText: 'Entrez votre nom',
  enabled: true,
  onChanged: (value) {},
  // Autres options disponibles
)
```

### Boutons avec dégradé

```dart
AuroraTheme.auroraGradientButton(
  text: 'Cliquez ici',
  onPressed: () {},
  isLoading: false, // Optionnel
  height: 50, // Optionnel
)
```

### Boutons de téléchargement

```dart
AuroraTheme.auroraDownloadButton(
  text: 'Télécharger',
  icon: Icons.download,
  onPressed: () {},
)
```

## 🎨 Couleurs disponibles

```dart
// Couleurs principales
AuroraTheme.primaryGreen    // #2D6A4F
AuroraTheme.lightGreen      // #52B788
AuroraTheme.darkGreen       // #1B4332
AuroraTheme.emeraldGreen    // #40916C
AuroraTheme.tealGreen       // #74C69D

// Couleurs d'accent
AuroraTheme.accentGreen     // #4CAF50
AuroraTheme.lightAccentGreen // #81C784
AuroraTheme.tealAccent      // #26A69A
AuroraTheme.lightTealAccent // #4DB6AC

// Autres couleurs
AuroraTheme.starYellow      // #F4D03F
AuroraTheme.inputBackground // #E8F5E8
```

## 🌈 Dégradés disponibles

```dart
// Dégradé principal (arrière-plan)
AuroraTheme.auroraGradient

// Dégradé des boutons
AuroraTheme.buttonGradient

// Dégradés des aurores boréales
AuroraTheme.auroraBand1
AuroraTheme.auroraBand2
```

## 📝 Exemple complet

```dart
import 'package:flutter/material.dart';
import 'package:wibbo_web/app/theme/theme.dart';

class ExemplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: AuroraTheme.auroraBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Titre
                Text(
                  'Ma Page',
                  style: theme.textTheme.headlineLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

                // Carte avec formulaire
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        AuroraTheme.auroraInputField(
                          context: context,
                          icon: Icons.person,
                          hintText: 'Nom',
                          enabled: true,
                          onChanged: (value) {},
                        ),

                        const SizedBox(height: 15),

                        Row(
                          children: [
                            Expanded(
                              child: AuroraTheme.auroraGradientButton(
                                text: 'Enregistrer',
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: AuroraTheme.auroraGradientButton(
                                text: 'Annuler',
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

## 🔧 Personnalisation

### Modifier les couleurs

Pour modifier les couleurs, éditez les constantes dans `aurora_theme.dart` :

```dart
static const Color primaryGreen = Color(0xFF2D6A4F);
```

### Ajouter de nouveaux composants

Pour ajouter de nouveaux composants stylisés, ajoutez-les dans la classe `AuroraTheme` :

```dart
static Widget monNouveauComposant({
  required String text,
  required VoidCallback onPressed,
}) {
  return Container(
    // Votre implémentation
  );
}
```

## 📱 Responsive Design

Le thème est conçu pour être responsive. Les composants s'adaptent automatiquement à différentes tailles d'écran.

## 🎯 Bonnes pratiques

1. **Utilisez toujours** `AuroraTheme.auroraBackground` pour l'arrière-plan
2. **Préférez** les composants du thème aux widgets Flutter standard
3. **Utilisez** les couleurs du thème plutôt que des couleurs hardcodées
4. **Respectez** la hiérarchie des textes avec `theme.textTheme`

## 🐛 Dépannage

### Le thème ne s'applique pas

- Vérifiez que `AuroraTheme.theme` est bien défini dans `MaterialApp`
- Assurez-vous que l'import est correct : `import 'package:wibbo_web/app/theme/theme.dart';`

### Les couleurs ne s'affichent pas

- Vérifiez que vous utilisez les constantes de couleur du thème
- Assurez-vous que le thème est bien appliqué globalement

### Les composants ne s'affichent pas

- Vérifiez que tous les paramètres requis sont fournis
- Consultez la console pour les erreurs de compilation
