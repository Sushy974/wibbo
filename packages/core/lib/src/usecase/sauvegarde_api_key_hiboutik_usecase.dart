// ignore_for_file: public_member_api_docs

import 'package:core/core.dart';

class SauvegardeApiKeyHiboutikUsecase {
  const SauvegardeApiKeyHiboutikUsecase({
    required CompteUtilisateurRepository compteUtilisateurRepository,
  }) : _compteUtilisateurRepository = compteUtilisateurRepository;

  final CompteUtilisateurRepository _compteUtilisateurRepository;

  Future<void> execute(SauvegardeApiKeyHiboutikCommand command) async {
    await _compteUtilisateurRepository.updateApiKeyHiboutik(
      uid: command.uid,
      newApiKey: command.apiKeyHiboutik,
    );
  }
}

class SauvegardeApiKeyHiboutikCommand {
  const SauvegardeApiKeyHiboutikCommand({
    required this.uid,
    required this.apiKeyHiboutik,
  });

  final String uid;
  final String apiKeyHiboutik;
}
