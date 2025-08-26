// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:text_theme/text_theme.dart';
import 'package:wibbo_web/app/bloc/app_bloc.dart';
import 'package:wibbo_web/app/theme/theme.dart';
import 'package:wibbo_web/l10n/l10n.dart';
import 'package:wibbo_web/pages/inscription/bloc/inscription_bloc.dart';

class InscriptionView extends StatelessWidget {
  const InscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return BlocConsumer<InscriptionBloc, InscriptionState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) async {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 3),
              backgroundColor: theme.colorScheme.error,
              content: BodyText(
                'Erreur lors de l\'inscription',
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
        final bloc = context.watch<InscriptionBloc>();
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
                                  'Inscription',
                                  style: theme.textTheme.headlineMedium
                                      ?.copyWith(
                                        color: AuroraTheme.primaryGreen,
                                      ),
                                ),

                                const SizedBox(height: 30),

                                // Section Informations personnelles
                                _buildSectionTitle('Informations personnelles'),

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
                                    InscriptionEmailChanged(value.trim()),
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
                                    InscriptionMotDePasseChanged(value),
                                  ),
                                  textInputAction: TextInputAction.next,
                                  autofillHints: const [
                                    AutofillHints.newPassword,
                                  ],
                                  suffixIcon: IconButton(
                                    onPressed: () => bloc.add(
                                      const InscriptionShowMotDePasseChanged(),
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

                                // Champ confirmation mot de passe
                                AuroraTheme.auroraInputField(
                                  context: context,
                                  icon: Icons.lock_outline,
                                  hintText: 'Confirmez votre mot de passe',
                                  enabled: state.status.isNotInProgress,
                                  obscureText:
                                      !state.confirmationMotDePasseVisible,
                                  errorText:
                                      state
                                          .confirmationMotDePasse
                                          .isNotPureEtNotValid
                                      ? state.confirmationMotDePasse.error
                                            ?.text()
                                      : null,
                                  onChanged: (value) => bloc.add(
                                    InscriptionConfirmationMotDePasseChanged(
                                      value,
                                    ),
                                  ),
                                  textInputAction: TextInputAction.next,
                                  autofillHints: const [
                                    AutofillHints.newPassword,
                                  ],
                                  suffixIcon: IconButton(
                                    onPressed: () => bloc.add(
                                      const InscriptionShowConfirmationMotDePasseChanged(),
                                    ),
                                    icon: Icon(
                                      state.confirmationMotDePasseVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: AuroraTheme.primaryGreen,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 30),

                                // Section Hiboutik
                                _buildSectionTitle('Configuration Hiboutik'),

                                // Champ email Hiboutik
                                AuroraTheme.auroraInputField(
                                  context: context,
                                  icon: Icons.email,
                                  hintText: 'Email Hiboutik',
                                  enabled: state.status.isNotInProgress,
                                  onChanged: (value) => bloc.add(
                                    InscriptionHiboutikEmailChanged(
                                      value.trim(),
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                ),

                                const SizedBox(height: 20),

                                // Champ ID vendeur Hiboutik
                                AuroraTheme.auroraInputField(
                                  context: context,
                                  icon: Icons.badge,
                                  hintText: 'ID Vendeur Hiboutik',
                                  enabled: state.status.isNotInProgress,
                                  onChanged: (value) => bloc.add(
                                    InscriptionHiboutikIdVendeurChanged(
                                      value.trim(),
                                    ),
                                  ),
                                  textInputAction: TextInputAction.next,
                                ),

                                const SizedBox(height: 20),

                                // Champ mot de passe Hiboutik
                                AuroraTheme.auroraInputField(
                                  context: context,
                                  icon: Icons.lock,
                                  hintText: 'Mot de passe Hiboutik',
                                  enabled: state.status.isNotInProgress,
                                  obscureText: !state.hiboutikMotDePasseVisible,
                                  onChanged: (value) => bloc.add(
                                    InscriptionHiboutikMotDePasseChanged(value),
                                  ),
                                  textInputAction: TextInputAction.next,
                                  suffixIcon: IconButton(
                                    onPressed: () => bloc.add(
                                      const InscriptionShowHiboutikMotDePasseChanged(),
                                    ),
                                    icon: Icon(
                                      state.hiboutikMotDePasseVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: AuroraTheme.primaryGreen,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 20),

                                // Champ URL Hiboutik
                                AuroraTheme.auroraInputField(
                                  context: context,
                                  icon: Icons.link,
                                  hintText: 'URL Hiboutik',
                                  enabled: state.status.isNotInProgress,
                                  onChanged: (value) => bloc.add(
                                    InscriptionUrlHiboutikChanged(value.trim()),
                                  ),
                                  keyboardType: TextInputType.url,
                                  textInputAction: TextInputAction.next,
                                ),

                                const SizedBox(height: 30),

                                // Section Wix
                                _buildSectionTitle('Configuration Wix'),

                                // Champ URL Wix
                                AuroraTheme.auroraInputField(
                                  context: context,
                                  icon: Icons.link,
                                  hintText: 'URL Wix',
                                  enabled: state.status.isNotInProgress,
                                  onChanged: (value) => bloc.add(
                                    InscriptionUrlWixChanged(value.trim()),
                                  ),
                                  keyboardType: TextInputType.url,
                                  textInputAction: TextInputAction.next,
                                ),

                                const SizedBox(height: 20),

                                // Champ API Key Wix
                                AuroraTheme.auroraInputField(
                                  context: context,
                                  icon: Icons.key,
                                  hintText: 'Clé API Wix',
                                  enabled: state.status.isNotInProgress,
                                  onChanged: (value) => bloc.add(
                                    InscriptionWixApiKeyChanged(value.trim()),
                                  ),
                                  textInputAction: TextInputAction.next,
                                ),

                                const SizedBox(height: 20),

                                // Champ Site ID Wix
                                AuroraTheme.auroraInputField(
                                  context: context,
                                  icon: Icons.web,
                                  hintText: 'ID Site Wix',
                                  enabled: state.status.isNotInProgress,
                                  onChanged: (value) => bloc.add(
                                    InscriptionWixSiteIdChanged(value.trim()),
                                  ),
                                  textInputAction: TextInputAction.done,
                                  onSubmitted: (_) {
                                    bloc.add(const InscriptionSubmitted());
                                  },
                                ),

                                const SizedBox(height: 30),

                                // Bouton d'inscription
                                AuroraTheme.auroraGradientButton(
                                  text: 'S\'inscrire',
                                  onPressed:
                                      state.status.isNotInProgress &&
                                          bloc.isValid
                                      ? () => bloc.add(
                                          const InscriptionSubmitted(),
                                        )
                                      : null,
                                  isLoading: state.status.isInProgress,
                                ),

                                const SizedBox(height: 30),

                                // Lien vers connexion
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Déjà un compte ? ',
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.read<AppBloc>().add(
                                          const AppAuthenticationNavigationChanged(
                                            authenticationNavigation:
                                                AuthenticationNavigation
                                                    .pageConnexion,
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Se connecter',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                              color: AuroraTheme.primaryGreen,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
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

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: AuroraTheme.primaryGreen.withOpacity(0.3),
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              title,
              style: const TextStyle(
                color: AuroraTheme.primaryGreen,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: AuroraTheme.primaryGreen.withOpacity(0.3),
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
