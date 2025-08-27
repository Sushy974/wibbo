import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wibbo_web/app/bloc/app_bloc.dart';
import 'package:wibbo_web/app/theme/theme.dart';
import 'package:wibbo_web/dialog/sauvegarde_email_hiboutik/sauvegarde_email_hiboutik.dart';
import 'package:wibbo_web/dialog/sauvegarde_api_key_hiboutik/sauvegarde_api_key_hiboutik.dart';
import 'package:wibbo_web/dialog/sauvegarde_url_hiboutik/sauvegarde_url_hiboutik.dart';
import 'package:wibbo_web/dialog/sauvegarde_id_vendeur_hiboutik/sauvegarde_id_vendeur_hiboutik.dart';
import 'package:wibbo_web/dialog/sauvegarde_url_wix/sauvegarde_url_wix.dart';
import 'package:wibbo_web/dialog/sauvegarde_site_id_wix/sauvegarde_site_id_wix.dart';
import 'package:wibbo_web/dialog/sauvegarde_api_key_wix/sauvegarde_api_key_wix.dart';
import 'package:wibbo_web/pages/profile/bloc/profile_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state.isLoading) {
          return AuroraTheme.auroraBackground(
            child: const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: AuroraTheme.primaryGreen,
                ),
              ),
            ),
          );
        }

        if (state.isFailure) {
          return AuroraTheme.auroraBackground(
            child: Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Erreur: ${state.errorMessage ?? "Erreur inconnue"}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (state.hasUser) {
                          context.read<ProfileBloc>().add(
                            ProfileLoadCompteUtilisateur(userId: state.user.id),
                          );
                        }
                      },
                      child: const Text('Réessayer'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (!state.hasUser) {
          return AuroraTheme.auroraBackground(
            child: const Scaffold(
              body: Center(
                child: Text(
                  'Aucun utilisateur connecté',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          );
        }

        if (!state.hasCompteUtilisateur) {
          return AuroraTheme.auroraBackground(
            child: const Scaffold(
              body: Center(
                child: Text(
                  'Compte utilisateur non trouvé',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          );
        }

        final compte = state.compteUtilisateur!;
        final dateFormat = DateFormat('dd/MM/yyyy HH:mm');

        return AuroraTheme.auroraBackground(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Mon Profil'),
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                ElevatedButton(
                  onPressed: () => _showDeconnexionDialog(context),
                  child: const Text('Se déconnecter'),
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader('Informations Générales'),
                  _buildInfoCard([
                    _buildInfoRow('ID Compte', compte.idCompte),
                    _buildInfoRow('Email', compte.email),
                    _buildInfoRow(
                      'Date de création',
                      dateFormat.format(compte.dateCreation),
                    ),
                    if (compte.dateValiditer != null)
                      _buildInfoRow(
                        'Date de validité',
                        dateFormat.format(compte.dateValiditer!),
                      ),
                  ]),

                  const SizedBox(height: 24),
                  _buildSectionHeader('Configuration Hiboutik'),
                  _buildInfoCard([
                    _buildEditableInfoRow(
                      context,
                      'Email Hiboutik',
                      compte.hiboutikEmail,
                      onTap: () => SauvegardeEmailHiboutikPage.show(
                        context,
                        currentEmail: compte.hiboutikEmail,
                        uid: compte.idCompte,
                      ),
                    ),
                    _buildEditableInfoRow(
                      context,
                      'API Key Hiboutik',
                      _maskApiKey(compte.hiboutikMotDePasse),
                      onTap: () => SauvegardeApiKeyHiboutikPage.show(
                        context,
                        currentApiKey: compte.hiboutikMotDePasse,
                        uid: compte.idCompte,
                      ),
                    ),
                    _buildEditableInfoRow(
                      context,
                      'URL Hiboutik',
                      compte.urlHiboutik,
                      onTap: () => SauvegardeUrlHiboutikPage.show(
                        context,
                        currentUrl: compte.urlHiboutik,
                        uid: compte.idCompte,
                      ),
                    ),
                    _buildEditableInfoRow(
                      context,
                      'ID Vendeur Hiboutik',
                      compte.hiboutikIdVendeur,
                      onTap: () => SauvegardeIdVendeurHiboutikPage.show(
                        context,
                        currentIdVendeur: compte.hiboutikIdVendeur,
                        uid: compte.idCompte,
                      ),
                    ),
                    _buildCopyableInfoRow(
                      context,
                      'Webhook Hiboutik',
                      compte.hiboutikWebHook,
                    ),
                    _buildCopyableInfoRow(
                      context,
                      'Webhook Création Article',
                      compte.hiboutikWebHookCreationArticle,
                    ),
                  ]),

                  const SizedBox(height: 24),
                  _buildSectionHeader('Configuration Wix'),
                  _buildInfoCard([
                    _buildEditableInfoRow(
                      context,
                      'URL Wix',
                      compte.urlWix,
                      onTap: () => SauvegardeUrlWixPage.show(
                        context,
                        currentUrl: compte.urlWix,
                        uid: compte.idCompte,
                      ),
                    ),
                    _buildEditableInfoRow(
                      context,
                      'Site ID Wix',
                      compte.wixSiteId,
                      onTap: () => SauvegardeSiteIdWixPage.show(
                        context,
                        currentSiteId: compte.wixSiteId,
                        uid: compte.idCompte,
                      ),
                    ),
                    _buildEditableInfoRow(
                      context,
                      'API Key Wix',
                      _maskApiKey(compte.wixApiKey),
                      onTap: () => SauvegardeApiKeyWixPage.show(
                        context,
                        currentApiKey: compte.wixApiKey,
                        uid: compte.idCompte,
                      ),
                    ),
                    _buildCopyableInfoRow(
                      context,
                      'Webhook Wix',
                      compte.wixWebHook,
                    ),
                  ]),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: AuroraTheme.auroraBand1,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildInfoCard(List<Widget> children) {
    return Card(
      elevation: 8,
      shadowColor: AuroraTheme.primaryGreen.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AuroraTheme.primaryGreen,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              value.isEmpty ? 'Non configuré' : value,
              style: const TextStyle(
                fontSize: 16,
                color: AuroraTheme.darkGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCopyableInfoRow(
    BuildContext context,
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AuroraTheme.primaryGreen,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value.isEmpty ? 'Non configuré' : value,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AuroraTheme.darkGreen,
                    ),
                  ),
                ),
                if (value.isNotEmpty)
                  IconButton(
                    onPressed: () => _copyToClipboard(context, value, label),
                    icon: const Icon(
                      Icons.copy,
                      color: AuroraTheme.primaryGreen,
                    ),
                    tooltip: 'Copier $label',
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _maskPassword(String password) {
    if (password.isEmpty) return 'Non configuré';
    return '•' * password.length;
  }

  String _maskApiKey(String apiKey) {
    if (apiKey.isEmpty) return 'Non configuré';
    if (apiKey.length <= 8) return '•' * apiKey.length;
    return '${apiKey.substring(0, 4)}${'•' * (apiKey.length - 8)}${apiKey.substring(apiKey.length - 4)}';
  }

  void _copyToClipboard(BuildContext context, String text, String label) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label copié dans le presse-papiers'),
        backgroundColor: AuroraTheme.primaryGreen,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget _buildEditableInfoRow(
    BuildContext context,
    String label,
    String value, {
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AuroraTheme.primaryGreen,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AuroraTheme.inputBackground,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AuroraTheme.primaryGreen.withOpacity(0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        value.isEmpty ? 'Non configuré' : value,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AuroraTheme.darkGreen,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.edit,
                      size: 16,
                      color: AuroraTheme.primaryGreen.withOpacity(0.7),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDeconnexionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Se déconnecter'),
          content: const Text('Êtes-vous sûr de vouloir vous déconnecter ?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.read<AppBloc>().add(const AppDeconnexion());
              },
              child: const Text('Se déconnecter'),
            ),
          ],
        );
      },
    );
  }
}
