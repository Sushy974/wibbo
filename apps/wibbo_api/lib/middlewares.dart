// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:dart_firebase_admin/dart_firebase_admin.dart';
import 'package:dart_firebase_admin/firestore.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:wibbo_api/variables.dart';

Middleware firestore() {
  return provider<Future<Firestore>>(
    (context) async {
      final jsonNotificationServiceDecode = json
          .decode(jsonEncode(jsonNotificationService)) as Map<String, dynamic>;

      final projectId = jsonNotificationServiceDecode['project_id'] as String;
      final emailCredential =
          jsonNotificationServiceDecode['client_email'] as String;
      final clientId = jsonNotificationServiceDecode['client_id'] as String;
      final privateKey = jsonNotificationServiceDecode['private_key'] as String;

      final firebaseAdmin = FirebaseAdminApp.initializeApp(
        projectId,
        Credential.fromServiceAccountParams(
          email: emailCredential,
          clientId: clientId,
          privateKey: privateKey,
        ),
      );

      return Firestore(
        firebaseAdmin,
      );
    },
  );
}

String apiKeyDuJour(String compteId) {
  return base64Encode(
    utf8.encode(
      '${DateTime.now().day + DateTime.now().month + DateTime.now().year}'
      '+AW3NZ33Fg33647M-e8RUC32Bjx4rdScr4m7xY-s84TJCcLtMc5twQ5Rgw7eHh5'
      '+Hiboutik-Wix123+',
    ),
  );
}
