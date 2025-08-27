import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:wibbo_web/dialog/sauvegarde_api_key_hiboutik/bloc/sauvegarde_api_key_hiboutik_bloc.dart';
import 'package:wibbo_web/app/theme/aurora_theme.dart';

class SauvegardeApiKeyHiboutikView extends StatefulWidget {
  const SauvegardeApiKeyHiboutikView({
    super.key,
    required this.currentApiKey,
    required this.uid,
  });

  final String currentApiKey;
  final String uid;

  @override
  State<SauvegardeApiKeyHiboutikView> createState() =>
      _SauvegardeApiKeyHiboutikViewState();
}

class _SauvegardeApiKeyHiboutikViewState
    extends State<SauvegardeApiKeyHiboutikView> {
  late final TextEditingController _apiKeyController;

  @override
  void initState() {
    super.initState();
    _apiKeyController = TextEditingController(text: widget.currentApiKey);
  }

  @override
  void dispose() {
    _apiKeyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<
      SauvegardeApiKeyHiboutikBloc,
      SauvegardeApiKeyHiboutikState
    >(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == SauvegardeApiKeyHiboutikStatus.success) {
          Navigator.of(context).pop();
        }
        if (state.status == SauvegardeApiKeyHiboutikStatus.failure) {
          showDialog<void>(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text('Erreur: API Key Hiboutik non mise à jour'),
            ),
          );
        }
      },
      child: Dialog(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.key, color: Colors.blue),
                    const SizedBox(width: 8),
                    const Text(
                      'Modifier l\'API Key Hiboutik',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                BlocBuilder<
                  SauvegardeApiKeyHiboutikBloc,
                  SauvegardeApiKeyHiboutikState
                >(
                  builder: (context, state) {
                    return AuroraTheme.auroraInputField(
                      context: context,
                      icon: Icons.key,
                      hintText: 'Entrez la nouvelle API key Hiboutik',
                      enabled: !state.isLoading,
                      errorText: state.apiKey.isNotPureEtNotValid
                          ? 'API key non valide'
                          : null,
                      onChanged: (value) =>
                          context.read<SauvegardeApiKeyHiboutikBloc>().add(
                            SauvegardeApiKeyHiboutikApiKeyChanged(value.trim()),
                          ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                    );
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Annuler'),
                    ),
                    const SizedBox(width: 8),
                    BlocBuilder<
                      SauvegardeApiKeyHiboutikBloc,
                      SauvegardeApiKeyHiboutikState
                    >(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: state.isValid && !state.isLoading
                              ? () {
                                  context
                                      .read<SauvegardeApiKeyHiboutikBloc>()
                                      .add(
                                        const SauvegardeApiKeyHiboutikSubmitted(),
                                      );
                                }
                              : null,
                          child: state.isLoading
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
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
