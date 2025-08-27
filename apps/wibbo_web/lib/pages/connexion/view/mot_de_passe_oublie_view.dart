// ignore_for_file: lines_longer_than_80_chars

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_theme/text_theme.dart';
import 'package:wibbo_web/l10n/l10n.dart';

class MotDePasseOublieView extends StatefulWidget {
  const MotDePasseOublieView({super.key});

  @override
  State<MotDePasseOublieView> createState() => _MotDePasseOublieViewState();
}

class _MotDePasseOublieViewState extends State<MotDePasseOublieView> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const LabelText('l10n.motDePasseOublie'),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    'l10n.veuillezSaisirVotreAdresseEmailPourRecevoirUnLienDeReinitialisationDeVotreMotDePasse',
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: controller,
                    autofillHints: const [AutofillHints.email],
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      labelText: 'l10n.email',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => valide(context),
                    child: LabelText(
                      'l10n.envoyer',
                      style: theme.textTheme
                          .label(context)
                          ?.copyWith(
                            color: theme.colorScheme.onPrimary,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> valide(BuildContext context) async {
    await context
        .read<AuthenticationRepository>()
        .envoiEmailRecuperationMotDePasse(
          email: controller.text,
        );

    if (!context.mounted) return;
    final theme = Theme.of(context);
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        content: const LabelText(
          'context.l10n.unEmailDeRecuperationDeMotDePasseVousAEteEnvoye',
        ),
        actions: [
          OutlinedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'context.l10n.ok',
              style: theme.textTheme
                  .label(context)
                  ?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
            ),
          ),
        ],
      ),
    );
    if (!context.mounted) return;
    Navigator.of(context).pop();
  }
}
