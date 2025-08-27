import 'package:core/core.dart';

class SauvegardeEmailHiboutikUsecase {
  SauvegardeEmailHiboutikUsecase({
    required CompteUtilisateurRepository compteUtilisateurRepository,
  }) : _compteUtilisateurRepository = compteUtilisateurRepository;

  final CompteUtilisateurRepository _compteUtilisateurRepository;

  Future<void> execute(SauvegardeEmailHiboutikCommand command) async {
    await _compteUtilisateurRepository.updateHiboutikEmail(
      newEmail: command.email,
      uid: command.uid,
    );
  }
}

class SauvegardeEmailHiboutikCommand {
  SauvegardeEmailHiboutikCommand({
    required this.email,
    required this.uid,
  });
  final String email;
  final String uid;
}
