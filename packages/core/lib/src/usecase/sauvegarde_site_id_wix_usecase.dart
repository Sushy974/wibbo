import 'package:core/core.dart';

class SauvegardeSiteIdWixUsecase {
  SauvegardeSiteIdWixUsecase({
    required CompteUtilisateurRepository compteUtilisateurRepository,
  }) : _compteUtilisateurRepository = compteUtilisateurRepository;

  final CompteUtilisateurRepository _compteUtilisateurRepository;

  Future<void> execute(SauvegardeSiteIdWixCommand command) async {
    await _compteUtilisateurRepository.updateWixSiteId(
      newSiteId: command.siteId,
      uid: command.uid,
    );
  }
}

class SauvegardeSiteIdWixCommand {
  SauvegardeSiteIdWixCommand({
    required this.siteId,
    required this.uid,
  });
  final String siteId;
  final String uid;
}
