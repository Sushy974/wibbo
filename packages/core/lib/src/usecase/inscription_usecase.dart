// ignore_for_file: public_member_api_docs

import 'package:authentication_repository/authentication_repository.dart';
import 'package:core/src/models/compte_utilisateur.dart';
import 'package:core/src/repository/compte_utilisateur_repository.dart';

const apiUrl = 'https://api.wibbo.fr/v1';

class InscriptionUsecase {
  InscriptionUsecase({
    required AuthenticationRepository authenticationRepository,
    required CompteUtilisateurRepository compteUtilisateurRepository,
  }) : _authenticationRepository = authenticationRepository,
       _compteUtilisateurRepository = compteUtilisateurRepository;

  final AuthenticationRepository _authenticationRepository;
  final CompteUtilisateurRepository _compteUtilisateurRepository;

  Future<void> execute(InscriptionCommande commande) async {
    final userCredential = await _authenticationRepository
        .inscriptionEmailMotDePasse(
          email: commande.email,
          password: commande.password,
        );

    print('user créer : ${userCredential.user?.uid}');
    final compteUtilisateur = CompteUtilisateur(
      idCompte: userCredential.user!.uid,
      email: commande.email,
      hiboutikEmail: commande.hiboutikEmail,
      hiboutikIdVendeur: commande.hiboutikIdVendeur,
      hiboutikMotDePasse: commande.hiboutikMotDePasse,

      urlWix: commande.urlWix,
      wixApiKey: commande.wixApiKey,
      wixSiteId: commande.wixSiteId,
      dateCreation: DateTime.now(),
      dateValiditer: null,
      urlHiboutik: commande.urlHiboutik,
      wixWebHook:
          '$apiUrl/hiboutik_creation_vente?utilisateur=${userCredential.user!.uid}',
      hiboutikWebHook:
          '$apiUrl/wix_decremente_stock?utilisateur=${userCredential.user!.uid}',
    );
    await _compteUtilisateurRepository.createCompteUtilisateur(
      compteUtilisateur,
    );
  }
}

class InscriptionCommande {
  InscriptionCommande({
    required this.email,
    required this.password,
    required this.hiboutikEmail,
    required this.hiboutikIdVendeur,
    required this.hiboutikMotDePasse,
    required this.urlWix,
    required this.wixApiKey,
    required this.wixSiteId,
    required this.urlHiboutik,
  });
  final String email;
  final String password;
  final String hiboutikEmail;
  final String hiboutikIdVendeur;
  final String hiboutikMotDePasse;
  final String urlWix;
  final String wixApiKey;
  final String wixSiteId;
  final String urlHiboutik;
}
