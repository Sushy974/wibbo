import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:wibbo_web/app/theme/theme.dart';
import 'package:wibbo_web/dialog/sauvegarde_api_key_wix/bloc/sauvegarde_api_key_wix_bloc.dart';

class SauvegardeApiKeyWixView extends StatelessWidget {
  const SauvegardeApiKeyWixView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SauvegardeApiKeyWixBloc, SauvegardeApiKeyWixState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) async {
        if (state.isSuccess) {
          await showDialog<void>(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text('API Key Wix mise à jour avec succès'),
            ),
          );
          if (!context.mounted) return;
          Navigator.of(context).pop();
        }
        if (state.isFailure) {
          await showDialog<void>(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text('Erreur: API Key Wix non mise à jour'),
            ),
          );
          if (!context.mounted) return;
          Navigator.of(context).pop();
        }
      },
      child: const _SauvegardeApiKeyWixDialogView(),
    );
  }
}

class _SauvegardeApiKeyWixDialogView extends StatelessWidget {
  const _SauvegardeApiKeyWixDialogView();

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
                    'Modifier API Key Wix',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Champ API Key
                BlocBuilder<SauvegardeApiKeyWixBloc, SauvegardeApiKeyWixState>(
                  builder: (context, state) {
                    return AuroraTheme.auroraInputField(
                      context: context,
                      icon: Icons.vpn_key,
                      hintText: 'Entrez la nouvelle API Key Wix',
                      enabled: !state.isLoading,
                      errorText: state.apiKey.isNotPureEtNotValid
                          ? state.apiKey.error?.text()
                          : null,
                      onChanged: (value) =>
                          context.read<SauvegardeApiKeyWixBloc>().add(
                            SauvegardeApiKeyWixApiKeyChanged(value.trim()),
                          ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
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
                    BlocBuilder<
                      SauvegardeApiKeyWixBloc,
                      SauvegardeApiKeyWixState
                    >(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: state.isValid && !state.isLoading
                              ? () =>
                                    context.read<SauvegardeApiKeyWixBloc>().add(
                                      const SauvegardeApiKeyWixSubmitted(),
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
