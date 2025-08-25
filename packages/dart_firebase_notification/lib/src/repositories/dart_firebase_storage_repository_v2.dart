import 'dart:io';
import 'dart:typed_data';

import 'package:dart_firebase_notification/src/repositories/storage_api.dart';
import 'package:firebase_dart/firebase_dart.dart' as firebase_dart;
import 'package:http/http.dart' as http;

class DartFirebaseStorageRepository implements StorageApi {
  DartFirebaseStorageRepository({
    required firebase_dart.FirebaseStorage firebaseStorage,
  }) : _firebaseStorage = firebaseStorage;

  final firebase_dart.FirebaseStorage _firebaseStorage;

  @override
  Future<String> ajouteFichier({
    required String emplacementDeSauvegardeStorage,
    required String nomFichier,
    required File fichierAEnvoyer,
  }) async {
    final ref = _firebaseStorage
        .ref()
        .child(emplacementDeSauvegardeStorage)
        .child(nomFichier);
    await ref.putData(fichierAEnvoyer.readAsBytesSync());
    return ref.getDownloadURL();
  }

  @override
  Future<String> ajouteFichierEnBytes({
    required String emplacementDeSauvegardeStorage,
    required String nomFichier,
    required Uint8List fichierAEnvoyer,
  }) async {
    final task = await _firebaseStorage
        .ref()
        .child(emplacementDeSauvegardeStorage)
        .child(nomFichier)
        .putData(fichierAEnvoyer);

    return task.ref.getDownloadURL();
  }

  @override
  Future<File> recupereFichierParUrl({required String urlFichier}) {
    throw UnimplementedError();
  }

  @override
  Future<Uint8List> recupereFichierByteParUrl({
    required String urlFichier,
  }) async {
    final response = await http.get(Uri.parse(urlFichier));

    if (response.statusCode != 200) {
      throw Exception('Fichier non trouvé ou erreur de téléchargement');
    }

    return response.bodyBytes;
  }

  @override
  Future<Uint8List> recupereFichierBytesParCheminRelatif({
    required String cheminRelatifFichier,
  }) async {
    final data =
        await _firebaseStorage.ref().child(cheminRelatifFichier).getData();

    if (data == null) throw Exception('Fichier non trouvé');

    return data;
  }

  @override
  Future<bool> fichierExiste({required String cheminFichierRelatif}) async {
    try {
      final metaData = await _firebaseStorage
          .ref()
          .child(cheminFichierRelatif)
          .getMetadata();

      return metaData.size != null && metaData.size! > 0;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<firebase_dart.Reference?>> recupereListeFichiersBytesParKeys({
    required String cheminRelatifDossier,
    required List<String>? containKeys,
  }) async {
    final list =
        await _firebaseStorage.ref().child(cheminRelatifDossier).listAll();

    final listRef = list.items.where((element) {
      if (containKeys == null) return true;

      //Contain all key iin list
      return containKeys.every(
        (key) => element.name.toLowerCase().contains(
              key.toLowerCase(),
            ),
      );
    }).toList();
    final futures = <firebase_dart.Reference?>[];

    for (final element in listRef) {
      futures.add(_firebaseStorage
          .ref()
          .child('$cheminRelatifDossier/${element.name}'),);
    }

    return futures;
  }

  @override
  Future<void> deplaceFichier({
    required String emplacementDeSauvegardeStorage,
    required String emplacementDeSauvegardeStorageDestination,
  }) async {
    final fichierBytes = await _firebaseStorage
        .ref()
        .child(emplacementDeSauvegardeStorage)
        .getData();

    if (fichierBytes == null) throw Exception('Fichier non trouvé');

    await _firebaseStorage
        .ref()
        .child(emplacementDeSauvegardeStorageDestination)
        .putData(fichierBytes);

    await _firebaseStorage.ref().child(emplacementDeSauvegardeStorage).delete();
  }
}

class FakeDartFirebaseStorageRepository implements StorageApi {
  FakeDartFirebaseStorageRepository();

  Map<String, Uint8List> fichiers = {};

  @override
  Future<String> ajouteFichier({
    required String emplacementDeSauvegardeStorage,
    required String nomFichier,
    required File fichierAEnvoyer,
  }) async {
    fichiers['$emplacementDeSauvegardeStorage/$nomFichier'] =
        fichierAEnvoyer.readAsBytesSync();

    return 'https://fake-url.com/$emplacementDeSauvegardeStorage/$nomFichier';
  }

  @override
  Future<String> ajouteFichierEnBytes({
    required String emplacementDeSauvegardeStorage,
    required String nomFichier,
    required Uint8List fichierAEnvoyer,
  }) async {
    fichiers['$emplacementDeSauvegardeStorage/$nomFichier'] = fichierAEnvoyer;

    return 'https://fake-url.com/$emplacementDeSauvegardeStorage/$nomFichier';
  }

  @override
  Future<File> recupereFichierParUrl({required String urlFichier}) {
    throw UnimplementedError();
  }

  @override
  Future<Uint8List> recupereFichierBytesParCheminRelatif({
    required String cheminRelatifFichier,
  }) {
    return Future.value(fichiers[cheminRelatifFichier]);
  }

  @override
  Future<bool> fichierExiste({required String cheminFichierRelatif}) {
    return Future.value(fichiers.containsKey(cheminFichierRelatif));
  }

  @override
  Future<List<Uint8List?>> recupereListeFichiersBytesParKeys({
    required String cheminRelatifDossier,
    required List<String>? containKeys,
  }) {
    return Future.value([]);
  }

  @override
  Future<void> deplaceFichier({
    required String emplacementDeSauvegardeStorage,
    required String emplacementDeSauvegardeStorageDestination,
  }) {
    final fichierBytes = fichiers[emplacementDeSauvegardeStorage];

    if (fichierBytes == null) throw Exception('Fichier non trouvé');

    fichiers[emplacementDeSauvegardeStorageDestination] = fichierBytes;
    fichiers.remove(emplacementDeSauvegardeStorage);

    return Future.value();
  }

  @override
  Future<Uint8List> recupereFichierByteParUrl({required String urlFichier}) {
    throw UnimplementedError();
  }
}
