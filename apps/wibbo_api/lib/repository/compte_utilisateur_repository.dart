// ignore_for_file: public_member_api_docs

import 'package:dart_firebase_admin/firestore.dart';
import 'package:wibbo_api/models/compte_utilisateur.dart';

abstract class CompteUtilisateurRepository {
  Future<DateTime> recupereDateDeValiditer({required String uid});
  Future<CompteUtilisateur> recupereCompteUtilisateur({required String uid});
}

class FirestoreCompteUtilisateurRepository
    implements CompteUtilisateurRepository {
  const FirestoreCompteUtilisateurRepository({
    required Firestore firestore,
  }) : _firestore = firestore;

  final Firestore _firestore;
  final String collectionPath = 'compte_utilisateurs';

  @override
  Future<DateTime> recupereDateDeValiditer({required String uid}) async {
    final snapshot = await _firestore.collection(collectionPath).doc(uid).get();
    if (!snapshot.exists) throw Exception('Compte utilisateur non trouvé');
    final data = snapshot.data();
    if (data == null) throw Exception('Compte utilisateur non trouvé');
    return data['dateValiditer'] as DateTime;
  }

  @override
  Future<CompteUtilisateur> recupereCompteUtilisateur({
    required String uid,
  }) async {
    final snapshot = await _firestore.collection(collectionPath).doc(uid).get();
    if (!snapshot.exists) throw Exception('Compte utilisateur non trouvé');
    final data = snapshot.data();
    if (data == null) throw Exception('Compte utilisateur non trouvé');
    return CompteUtilisateur.fromJson(data as Map<String, dynamic>);
  }
}
