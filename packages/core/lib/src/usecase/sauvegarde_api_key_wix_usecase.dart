import 'package:core/core.dart';

class SauvegardeApiKeyWixUsecase {
  SauvegardeApiKeyWixUsecase({
    required CompteUtilisateurRepository compteUtilisateurRepository,
  }) : _compteUtilisateurRepository = compteUtilisateurRepository;

  final CompteUtilisateurRepository _compteUtilisateurRepository;

  Future<void> execute(SauvegardeApiKeyWixCommand command) async {
    await _compteUtilisateurRepository.updateWixApiKey(
      newApiKey: command.apiKey,
      uid: command.uid,
    );
  }
}

class SauvegardeApiKeyWixCommand {
  SauvegardeApiKeyWixCommand({
    required this.apiKey,
    required this.uid,
  });
  final String apiKey;
  final String uid;
}
