import 'dart:async';

import 'package:dart_firebase_admin/firestore.dart';
import 'package:dart_firebase_notification/src/models/notif.dart';
import 'package:dart_firebase_notification/src/models/statut_enum.dart';
import 'package:dart_firebase_notification/src/models/statut_envoi.dart';

abstract class NotifRepository {
  Future<Notif> recupereNotifParUid({required String uidNotif});
  Future<void> demarreEnvoiNotif({required String uidNotif});
  Future<void> termineEnvoiNotif({
    required String uidNotif,
    required List<Info> listeInfo,
  });
  Future<void> erreurEnvoiNotif({
    required String uidNotif,
    required String messageErreur,
  });
}

class FirestoreNotifRepository implements NotifRepository {
  const FirestoreNotifRepository({
    required this.firestore,
    required this.collectionName,
  });

  final Firestore firestore;
  final String collectionName;

  @override
  Future<Notif> recupereNotifParUid({required String uidNotif}) async {
    final notif =
        await firestore.collection(collectionName).doc(uidNotif).get().then(
              (value) => Notif.fromJson(value.data()!),
            );

    return notif;
  }

  @override
  Future<void> demarreEnvoiNotif({required String uidNotif}) async {
    final notif =
        await firestore.collection(collectionName).doc(uidNotif).get().then(
              (value) => Notif.fromJson(value.data()!),
            );

    await firestore.collection(collectionName).doc(uidNotif).update({
      'statutEnvoi':
          (notif.statutEnvoi ?? StatutEnvoi(dateDebutEnvoi: DateTime.now()))
              .copyWith(
                statutEnvoiEnum: StatutEnvoiEnum.enCours,
                dateDebutEnvoi: DateTime.now().toUtc(),
              )
              .toJson(),
    });
  }

  @override
  Future<void> termineEnvoiNotif({
    required String uidNotif,
    required List<Info> listeInfo,
  }) async {
    if (listeInfo.length > 20) {
      for (final info in listeInfo) {
        unawaited(
          firestore
              .collection(collectionName)
              .doc(uidNotif)
              .collection('responses')
              .add(info.toJson()),
        );
      }
    }
    final notif =
        await firestore.collection(collectionName).doc(uidNotif).get().then(
              (value) => Notif.fromJson(value.data()!),
            );
    await firestore.collection(collectionName).doc(uidNotif).update({
      'statutEnvoi': notif.statutEnvoi
          ?.copyWith(
            statutEnvoiEnum: StatutEnvoiEnum.termine,
            dateFinEnvoi: DateTime.now().toUtc(),
            responses: (listeInfo.length <= 20) ? listeInfo : [],
          )
          .toJson(),
    });
  }

  @override
  Future<void> erreurEnvoiNotif({
    required String uidNotif,
    required String messageErreur,
  }) async {
    final notif =
        await firestore.collection(collectionName).doc(uidNotif).get().then(
              (value) => Notif.fromJson(value.data()!),
            );
    await firestore.collection(collectionName).doc(uidNotif).update({
      'statutEnvoi': notif.statutEnvoi
          ?.copyWith(
            statutEnvoiEnum: StatutEnvoiEnum.erreur,
            dateFinEnvoi: DateTime.now().toUtc(),
            messageErreur: messageErreur,
          )
          .toJson(),
    });
  }
}
