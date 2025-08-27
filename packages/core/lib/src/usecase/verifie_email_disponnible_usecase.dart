// ignore_for_file: public_member_api_docs

import 'package:core/core.dart';

class VerifieEmailDisponnibleUsecase {
  VerifieEmailDisponnibleUsecase({
    required CompteUtilisateurRepository compteUtilisateurRepository,
  }) : _compteUtilisateurRepository = compteUtilisateurRepository;

  final CompteUtilisateurRepository _compteUtilisateurRepository;

  Future<bool> execute(VerifieEmailDisponnibleCommand command) async {
    print('command.email: ${command.email}');
    final compteUtilisateur = await _compteUtilisateurRepository
        .getCompteUtilisateurParEmail(command.email);
    print('compteUtilisateur: $compteUtilisateur');
    if (compteUtilisateur == null) {
      return true;
    }
    return false;
  }
}

class VerifieEmailDisponnibleCommand {
  VerifieEmailDisponnibleCommand({
    required this.email,
  });
  final String email;
}
