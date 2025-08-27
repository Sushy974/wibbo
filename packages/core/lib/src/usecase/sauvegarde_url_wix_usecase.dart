import 'package:core/core.dart';

class SauvegardeUrlWixUsecase {
  SauvegardeUrlWixUsecase({
    required CompteUtilisateurRepository compteUtilisateurRepository,
  }) : _compteUtilisateurRepository = compteUtilisateurRepository;

  final CompteUtilisateurRepository _compteUtilisateurRepository;

  Future<void> execute(SauvegardeUrlWixCommand command) async {
    await _compteUtilisateurRepository.updateUrlWix(
      newUrlWix: command.url,
      uid: command.uid,
    );
  }
}

class SauvegardeUrlWixCommand {
  SauvegardeUrlWixCommand({
    required this.url,
    required this.uid,
  });
  final String url;
  final String uid;
}
