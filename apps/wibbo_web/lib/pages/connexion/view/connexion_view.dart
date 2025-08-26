// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:text_theme/text_theme.dart';
import 'package:wibbo_web/app/theme/theme.dart';
import 'package:wibbo_web/l10n/l10n.dart';
import 'package:wibbo_web/pages/connexion/bloc/connexion_bloc.dart';

class ConnexionView extends StatelessWidget {
  const ConnexionView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return BlocConsumer<ConnexionBloc, ConnexionState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) async {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 3),
              backgroundColor: theme.colorScheme.error,
              content: BodyText(
                'l10n.erreurConnexion',
                style: theme.textTheme
                    .body(context)
                    ?.copyWith(
                      color: theme.colorScheme.onError,
                    ),
              ),
            ),
          );
          return;
        }
      },
      builder: (context, state) {
        final bloc = context.watch<ConnexionBloc>();
        final theme = Theme.of(context);

        return PopScope(
          canPop: false,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: AuroraTheme.auroraBackground(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo et titre
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                // Logo
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AuroraTheme.primaryGreen,
                                      width: 3,
                                    ),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/icons/wibbo_logo_svg.svg',
                                      width: 50,
                                      height: 50,
                                      colorFilter: const ColorFilter.mode(
                                        AuroraTheme.primaryGreen,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 20),

                                // Titre
                                Text(
                                  'Connexion',
                                  style: theme.textTheme.headlineMedium
                                      ?.copyWith(
                                        color: AuroraTheme.primaryGreen,
                                      ),
                                ),

                                const SizedBox(height: 30),

                                // Champ email
                                AuroraTheme.auroraInputField(
                                  context: context,
                                  icon: Icons.person,
                                  hintText: 'Entrez votre email',
                                  enabled: state.status.isNotInProgress,
                                  errorText: state.email.isNotPureEtNotValid
                                      ? 'Email non valide'
                                      : null,
                                  onChanged: (value) => bloc.add(
                                    ConnexionEmailChanged(value.trim()),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  autofillHints: const [
                                    AutofillHints.email,
                                    AutofillHints.newUsername,
                                  ],
                                  textInputAction: TextInputAction.next,
                                ),

                                const SizedBox(height: 20),

                                // Champ mot de passe
                                AuroraTheme.auroraInputField(
                                  context: context,
                                  icon: Icons.lock,
                                  hintText: 'Entrez votre mot de passe',
                                  enabled: state.status.isNotInProgress,
                                  obscureText: !state.motDePasseVisible,
                                  errorText:
                                      state.motDePasse.isNotPureEtNotValid
                                      ? state.motDePasse.error?.text()
                                      : null,
                                  onChanged: (value) => bloc.add(
                                    ConnexionMotDePasseChanged(value),
                                  ),
                                  textInputAction: TextInputAction.done,
                                  autofillHints: const [
                                    AutofillHints.password,
                                  ],
                                  onSubmitted: (_) {
                                    bloc.add(const ConnexionSubmitted());
                                  },
                                  suffixIcon: IconButton(
                                    onPressed: () => bloc.add(
                                      const ConnexionShowMotDePasseChanged(),
                                    ),
                                    icon: Icon(
                                      state.motDePasseVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: AuroraTheme.primaryGreen,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 20),

                                // Options supplémentaires
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Remember me
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: false,
                                          onChanged: (value) {},
                                        ),
                                        Text(
                                          'Se souvenir de moi',
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),

                                    // Mot de passe oublié
                                    TextButton(
                                      onPressed: () =>
                                          ouvreMotDePasseOublie(context),
                                      child: Text(
                                        'Mot de passe oublié ?',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 30),

                                // Boutons de connexion
                                Row(
                                  children: [
                                    Expanded(
                                      child: AuroraTheme.auroraGradientButton(
                                        text: 'Connexion',
                                        onPressed:
                                            state.status.isNotInProgress &&
                                                bloc.isValid
                                            ? () => bloc.add(
                                                const ConnexionSubmitted(),
                                              )
                                            : null,
                                        isLoading: state.status.isInProgress,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      child: AuroraTheme.auroraGradientButton(
                                        text: 'Inscription',
                                        onPressed: () {
                                          // Navigation vers l'inscription
                                        },
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 30),

                                // Boutons de téléchargement
                                Row(
                                  children: [
                                    Expanded(
                                      child: AuroraTheme.auroraDownloadButton(
                                        text: 'Google Play',
                                        icon: Icons.android,
                                        onPressed: () {},
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      child: AuroraTheme.auroraDownloadButton(
                                        text: 'App Store',
                                        icon: Icons.apple,
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
            ),
          ),
        );
      },
    );
  }

  Future<void> ouvreMotDePasseOublie(BuildContext context) async {
    // await showDialog<void>(
    //   context: context,
    //   builder: (context) => const MotDePasseOublieView(),
    // );
  }
}
