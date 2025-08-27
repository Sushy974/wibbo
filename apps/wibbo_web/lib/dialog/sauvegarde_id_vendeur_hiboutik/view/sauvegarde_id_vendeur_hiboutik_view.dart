import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:wibbo_web/app/theme/theme.dart';
import 'package:wibbo_web/dialog/sauvegarde_id_vendeur_hiboutik/bloc/sauvegarde_id_vendeur_hiboutik_bloc.dart';

class SauvegardeIdVendeurHiboutikView extends StatelessWidget {
  const SauvegardeIdVendeurHiboutikView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SauvegardeIdVendeurHiboutikBloc, SauvegardeIdVendeurHiboutikState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('ID Vendeur Hiboutik mis à jour avec succès'),
              backgroundColor: AuroraTheme.primaryGreen,
            ),
          );
          Navigator.of(context).pop();
        }
        if (state.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Erreur: ${state.errorMessage ?? "Erreur inconnue"}',
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: const _SauvegardeIdVendeurHiboutikDialogView(),
    );
  }
}

class _SauvegardeIdVendeurHiboutikDialogView extends StatelessWidget {
  const _SauvegardeIdVendeurHiboutikDialogView();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 400,
          minWidth: 350,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, AuroraTheme.inputBackground],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // En-tête
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    gradient: AuroraTheme.auroraBand1,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Modifier ID Vendeur Hiboutik',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Champ ID Vendeur
                BlocBuilder<SauvegardeIdVendeurHiboutikBloc, SauvegardeIdVendeurHiboutikState>(
                  builder: (context, state) {
                    return AuroraTheme.auroraInputField(
                      context: context,
                      icon: Icons.badge,
                      hintText: 'Entrez le nouvel ID Vendeur Hiboutik',
                      enabled: !state.isLoading,
                      errorText: state.idVendeur.isNotPureEtNotValid
                          ? state.idVendeur.error?.text()
                          : null,
                      onChanged: (value) =>
                          context.read<SauvegardeIdVendeurHiboutikBloc>().add(
                            SauvegardeIdVendeurHiboutikIdChanged(value.trim()),
                          ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                    );
                  },
                ),

                const SizedBox(height: 24),

                // Boutons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Annuler'),
                    ),
                    BlocBuilder<SauvegardeIdVendeurHiboutikBloc, SauvegardeIdVendeurHiboutikState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: state.isValid && !state.isLoading
                              ? () => context
                                    .read<SauvegardeIdVendeurHiboutikBloc>()
                                    .add(
                                      const SauvegardeIdVendeurHiboutikSubmitted(),
                                    )
                              : null,
                          child: state.isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                )
                              : const Text('Sauvegarder'),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
