import 'package:flutter/material.dart';
import 'package:wibbo_web/app/theme/theme.dart';

/// Exemple de page utilisant le thème Aurora
class AuroraExamplePage extends StatelessWidget {
  const AuroraExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: AuroraTheme.auroraBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // En-tête avec titre
                Text(
                  'Exemple de Page',
                  style: theme.textTheme.headlineLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Cette page utilise le thème Aurora',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),

                const SizedBox(height: 30),

                // Carte avec contenu
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Formulaire d\'exemple',
                          style: theme.textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 20),

                        // Champs de saisie
                        AuroraTheme.auroraInputField(
                          context: context,
                          icon: Icons.person,
                          hintText: 'Nom complet',
                          enabled: true,
                          onChanged: (value) {},
                        ),

                        const SizedBox(height: 15),

                        AuroraTheme.auroraInputField(
                          context: context,
                          icon: Icons.email,
                          hintText: 'Email',
                          enabled: true,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {},
                        ),

                        const SizedBox(height: 15),

                        AuroraTheme.auroraInputField(
                          context: context,
                          icon: Icons.phone,
                          hintText: 'Téléphone',
                          enabled: true,
                          keyboardType: TextInputType.phone,
                          onChanged: (value) {},
                        ),

                        const SizedBox(height: 25),

                        // Boutons
                        Row(
                          children: [
                            Expanded(
                              child: AuroraTheme.auroraGradientButton(
                                text: 'Enregistrer',
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Données enregistrées !'),
                                      backgroundColor: AuroraTheme.primaryGreen,
                                    ),
                                  );
                                },
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

                const SizedBox(height: 20),

                // Autres éléments
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Autres composants',
                          style: theme.textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 15),

                        // Checkbox
                        Row(
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (value) {},
                            ),
                            Text(
                              'Accepter les conditions',
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // TextButton
                        TextButton(
                          onPressed: () {},
                          child: Text('Lire les conditions'),
                        ),

                        const SizedBox(height: 15),

                        // Boutons de téléchargement
                        Row(
                          children: [
                            Expanded(
                              child: AuroraTheme.auroraDownloadButton(
                                text: 'Télécharger PDF',
                                icon: Icons.download,
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: AuroraTheme.auroraDownloadButton(
                                text: 'Partager',
                                icon: Icons.share,
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
