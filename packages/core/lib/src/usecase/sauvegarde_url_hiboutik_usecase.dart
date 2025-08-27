import 'package:core/core.dart';

class SauvegardeUrlHiboutikUsecase {
  SauvegardeUrlHiboutikUsecase({
    required CompteUtilisateurRepository compteUtilisateurRepository,
  }) : _compteUtilisateurRepository = compteUtilisateurRepository;

  final CompteUtilisateurRepository _compteUtilisateurRepository;

  Future<void> execute(SauvegardeUrlHiboutikCommand command) async {
    await _compteUtilisateurRepository.updateUrlHiboutik(
      newUrl: command.url,
      uid: command.uid,
    );
  }
}

class SauvegardeUrlHiboutikCommand {
  SauvegardeUrlHiboutikCommand({
    required this.url,
    required this.uid,
  });
  final String url;
  final String uid;
}
