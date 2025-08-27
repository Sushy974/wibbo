// ignore_for_file: public_member_api_docs

import 'package:core/src/models/compte_utilisateur.dart';

abstract class CompteUtilisateurRepository {
  Future<CompteUtilisateur?> getCompteUtilisateurParEmail(String email);
  Future<CompteUtilisateur?> getCompteUtilisateurParUid(String uid);
  Stream<CompteUtilisateur?> getStreamCompteUtilisateurParUid(String uid);
  Future<void> createCompteUtilisateur(CompteUtilisateur compteUtilisateur);
  Future<void> deleteCompteUtilisateur(String email);
  Future<void> updateEmail({
    required String newEmail,
    required String uid,
  });
  Future<void> updateHiboutikEmail({
    required String newEmail,
    required String uid,
  });
  Future<void> updateApiKeyHiboutik({
    required String newApiKey,
    required String uid,
  });
  Future<void> updateHiboutikIdVendeur({
    required String newIdVendeur,
    required String uid,
  });
  Future<void> updateUrlHiboutik({
    required String newUrl,
    required String uid,
  });
  Future<void> updateHiboutikWebHook({
    required String newWebHook,
    required String uid,
  });
  Future<void> updateUrlWix({required String newUrlWix, required String uid});
  Future<void> updateWixSiteId({
    required String newSiteId,
    required String uid,
  });
  Future<void> updateWixApiKey({
    required String newApiKey,
    required String uid,
  });
}

class FirestoreCompteUtilisateurRepository
    implements CompteUtilisateurRepository {
  FirestoreCompteUtilisateurRepository({
    required CompteUtilisateurCollectionReference firestore,
  }) : _firestore = firestore;

  final CompteUtilisateurCollectionReference _firestore;

  @override
  Future<CompteUtilisateur?> getCompteUtilisateurParEmail(String email) async {
    final queryA = await _firestore.get();
    final docs = queryA.docs;
    for (var doc in docs) {
      print('doc: ${doc.data}');
    }

    final query = await _firestore.reference
        .where('email', isEqualTo: email)
        .get();
    return query.docs.firstOrNull?.data();
  }

  @override
  Future<CompteUtilisateur?> getCompteUtilisateurParUid(String uid) async {
    final query = await _firestore.whereDocumentId(isEqualTo: uid).get();
    return query.docs.firstOrNull?.data;
  }

  @override
  Future<void> createCompteUtilisateur(
    CompteUtilisateur compteUtilisateur,
  ) async {
    if (compteUtilisateur.idCompte.isEmpty) {
      throw Exception("L'id du compte utilisateur est vide");
    }
    await _firestore.doc(compteUtilisateur.idCompte).set(compteUtilisateur);
  }

  @override
  Future<void> deleteCompteUtilisateur(String email) async {
    final query = await _firestore.whereEmail(isEqualTo: email).get();
    if (query.docs.isEmpty) {
      throw Exception("Le compte utilisateur n'existe pas");
    }
    await query.docs.first.reference.delete();
  }

  @override
  Future<void> updateEmail({
    required String newEmail,
    required String uid,
  }) async {
    final query = await _firestore.whereDocumentId(isEqualTo: uid).get();
    if (query.docs.isEmpty) {
      throw Exception("Le compte utilisateur n'existe pas");
    }
    await query.docs.first.reference.update(
      email: newEmail,
    );
  }

  @override
  Future<void> updateHiboutikEmail({
    required String newEmail,
    required String uid,
  }) async {
    final query = await _firestore.whereDocumentId(isEqualTo: uid).get();
    if (query.docs.isEmpty) {
      throw Exception("Le compte utilisateur n'existe pas");
    }
    await query.docs.first.reference.update(
      hiboutikEmail: newEmail,
    );
  }

  @override
  Future<void> updateHiboutikIdVendeur({
    required String uid,
    required String newIdVendeur,
  }) async {
    final query = await _firestore.whereDocumentId(isEqualTo: uid).get();
    if (query.docs.isEmpty) {
      throw Exception("Le compte utilisateur n'existe pas");
    }
    await query.docs.first.reference.update(
      hiboutikIdVendeur: newIdVendeur,
    );
  }

  @override
  Future<void> updateUrlHiboutik({
    required String newUrl,
    required String uid,
  }) async {
    final query = await _firestore.whereDocumentId(isEqualTo: uid).get();
    if (query.docs.isEmpty) {
      throw Exception("Le compte utilisateur n'existe pas");
    }
    await query.docs.first.reference.update(
      urlHiboutik: newUrl,
    );
  }

  @override
  Future<void> updateApiKeyHiboutik({
    required String newApiKey,
    required String uid,
  }) async {
    final query = await _firestore.whereDocumentId(isEqualTo: uid).get();
    if (query.docs.isEmpty) {
      print('Le compte utilisateur n\'existe pas');
      throw Exception("Le compte utilisateur n'existe pas");
    }
    print('newApiKey: $newApiKey');
    await query.docs.first.reference.update(
      hiboutikMotDePasse: newApiKey,
    );
  }

  @override
  Future<void> updateHiboutikWebHook({
    required String newWebHook,
    required String uid,
  }) async {
    final query = await _firestore.whereDocumentId(isEqualTo: uid).get();
    if (query.docs.isEmpty) {
      throw Exception("Le compte utilisateur n'existe pas");
    }
    await query.docs.first.reference.update(
      hiboutikWebHook: newWebHook,
    );
  }

  @override
  Future<void> updateUrlWix({
    required String newUrlWix,
    required String uid,
  }) async {
    final query = await _firestore.whereDocumentId(isEqualTo: uid).get();
    if (query.docs.isEmpty) {
      throw Exception("Le compte utilisateur n'existe pas");
    }
    await query.docs.first.reference.update(
      urlWix: newUrlWix,
    );
  }

  @override
  Future<void> updateWixApiKey({
    required String newApiKey,
    required String uid,
  }) async {
    final query = await _firestore.whereDocumentId(isEqualTo: uid).get();
    if (query.docs.isEmpty) {
      throw Exception("Le compte utilisateur n'existe pas");
    }
    await query.docs.first.reference.update(
      wixApiKey: newApiKey,
    );
  }

  @override
  Future<void> updateWixSiteId({
    required String newSiteId,
    required String uid,
  }) async {
    final query = await _firestore.whereDocumentId(isEqualTo: uid).get();
    if (query.docs.isEmpty) {
      throw Exception("Le compte utilisateur n'existe pas");
    }
    await query.docs.first.reference.update(
      wixSiteId: newSiteId,
    );
  }

  @override
  Stream<CompteUtilisateur?> getStreamCompteUtilisateurParUid(String uid) {
    return _firestore
        .whereDocumentId(isEqualTo: uid)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.firstOrNull?.data,
        );
  }
}
