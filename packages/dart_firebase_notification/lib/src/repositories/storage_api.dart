import 'dart:io';
import 'dart:typed_data';

abstract class StorageApi {
  /// {@macro storage_api}
  Future<String> ajouteFichier({
    required String emplacementDeSauvegardeStorage,
    required String nomFichier,
    required File fichierAEnvoyer,
  });
  Future<String> ajouteFichierEnBytes({
    required String emplacementDeSauvegardeStorage,
    required String nomFichier,
    required Uint8List fichierAEnvoyer,
  });

  Future<void> deplaceFichier({
    required String emplacementDeSauvegardeStorage,
    required String emplacementDeSauvegardeStorageDestination,
  });

  Future<File> recupereFichierParUrl({
    required String urlFichier,
  });

  Future<Uint8List> recupereFichierBytesParCheminRelatif({
    required String cheminRelatifFichier,
  });

  Future<List<dynamic>> recupereListeFichiersBytesParKeys({
    required String cheminRelatifDossier,
    required List<String>? containKeys,
  });
  Future<bool> fichierExiste({required String cheminFichierRelatif});

  Future<Uint8List> recupereFichierByteParUrl({required String urlFichier});
}
