// ignore_for_file: one_member_abstracts

import 'package:dart_firebase_admin/firestore.dart';
import 'package:dart_firebase_notification/src/models/template.dart';

abstract class TemplateRepository {
  Future<Template> recupereTemplateParUid({required String uidTemplate});
}

class FirestoreTemplateRepository implements TemplateRepository {
  FirestoreTemplateRepository({
    required this.firestore,
    required this.collectionName,
  });

  final Firestore firestore;
  final String collectionName;

  @override
  Future<Template> recupereTemplateParUid({required String uidTemplate}) async {
    final template =
    await firestore.collection(collectionName).doc(uidTemplate).get().then(
          (value) => Template.fromJson(value.data()!),
    );

    return template;
  }
}
