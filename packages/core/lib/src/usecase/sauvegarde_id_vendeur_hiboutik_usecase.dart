import 'package:core/core.dart';

class SauvegardeIdVendeurHiboutikUsecase {
  SauvegardeIdVendeurHiboutikUsecase({
    required CompteUtilisateurRepository compteUtilisateurRepository,
  }) : _compteUtilisateurRepository = compteUtilisateurRepository;

  final CompteUtilisateurRepository _compteUtilisateurRepository;

  Future<void> execute(SauvegardeIdVendeurHiboutikCommand command) async {
    await _compteUtilisateurRepository.updateHiboutikIdVendeur(
      newIdVendeur: command.idVendeur,
      uid: command.uid,
    );
  }
}

class SauvegardeIdVendeurHiboutikCommand {
  SauvegardeIdVendeurHiboutikCommand({
    required this.idVendeur,
    required this.uid,
  });
  final String idVendeur;
  final String uid;
}
