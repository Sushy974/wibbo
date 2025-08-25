// ignore_for_file: public_member_api_docs

import 'package:wibbo_api/repository/compte_utilisateur_repository.dart';
import 'package:wibbo_api/services/logger_service.dart';

class VerifieCompteUsecase {
  const VerifieCompteUsecase({
    required CompteUtilisateurRepository compteUtilisateurRepository,
  }) : _compteUtilisateurRepository = compteUtilisateurRepository;

  final CompteUtilisateurRepository _compteUtilisateurRepository;

  Future<bool> execute({required VerifieCompteCommand command}) async {
    LoggerService.info('Vérification de compte utilisateur', 'VerifieCompteUsecase');
    LoggerService.debug('UID utilisateur: ${command.uid}', 'VerifieCompteUsecase');
    
    final dateDeValiditer =
        await _compteUtilisateurRepository.recupereDateDeValiditer(
      uid: command.uid,
    );
    
    final isValid = dateDeValiditer.isBefore(DateTime.now());
    LoggerService.info('Date de validité: $dateDeValiditer, Compte valide: $isValid', 'VerifieCompteUsecase');
    
    return isValid;
  }
}

class VerifieCompteCommand {
  const VerifieCompteCommand({
    required this.uid,
  });

  final String uid;
}
