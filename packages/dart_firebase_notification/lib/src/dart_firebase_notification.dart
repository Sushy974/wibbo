import 'dart:convert';

import 'package:dart_firebase_admin/dart_firebase_admin.dart';
import 'package:dart_firebase_admin/firestore.dart';
import 'package:dart_firebase_admin/messaging.dart';
import 'package:dart_firebase_notification/src/repositories/notif_repository.dart';
import 'package:dart_firebase_notification/src/repositories/template_repository.dart';
import 'package:dart_firebase_notification/src/usecase/envoi_notification_usecase.dart';
import 'package:firedart/auth/firebase_auth.dart';
import 'package:firedart/firedart.dart' as firedart;
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart';

/// {@template dart_firebase_notification}
/// notification
/// {@endtemplate}
class DartFirebaseNotification {
  /// {@macro dart_firebase_notification}
  DartFirebaseNotification({
    required Map<String, dynamic> jsonNotificationService,
    required String apiKey,
    required String emailAdmin,
    required String passwordAdmin,
    FirebaseAuth? firebaseAuth,
    Messaging? messaging,
    String? databaseId,
    String? icon,
    NotifRepository? notifRepository,
    TemplateRepository? templateRepository,
    String collectionNameNotif = 'notifs',
    String collectionNameTemplate = 'template_notifs',
  })  : _passwordAdmin = passwordAdmin,
        _emailAdmin = emailAdmin,
        _collectionNameTemplate = collectionNameTemplate,
        _collectionNameNotif = collectionNameNotif,
        _templateRepository = templateRepository,
        _notifRepository = notifRepository,
        _firebaseAuth = firebaseAuth,
        _databaseId = databaseId,
        _messaging = messaging,
        _icon = icon,
        _jsonNotificationService = jsonNotificationService,
        _apiKey = apiKey;

  final String _apiKey;
  final Map<String, dynamic> _jsonNotificationService;
  final FirebaseAuth? _firebaseAuth;
  final Messaging? _messaging;
  final NotifRepository? _notifRepository;
  final TemplateRepository? _templateRepository;
  final String _collectionNameNotif;
  final String _collectionNameTemplate;
  final String _emailAdmin;
  final String _passwordAdmin;
  final String? _databaseId;
  final String? _icon;

  AccessCredentials? accessCredentials;
  late final String _projectId;
  late final String _emailCredential;
  late final String _clientId;
  late final String _privateKey;

  Future<void> initialise() async {
    final jsonNotificationServiceDecode = json
        .decode(jsonEncode(_jsonNotificationService)) as Map<String, dynamic>;
    final accountCredentials = ServiceAccountCredentials.fromJson(
      jsonNotificationServiceDecode,
    );
    final scopes = [
      'https://www.googleapis.com/auth/cloud-platform',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];
    final client = Client();
    final credentials = await obtainAccessCredentialsViaServiceAccount(
      accountCredentials,
      scopes,
      client,
    );
    accessCredentials = credentials;
    _projectId = jsonNotificationServiceDecode['project_id'] as String;
    _emailCredential = jsonNotificationServiceDecode['client_email'] as String;
    _clientId = jsonNotificationServiceDecode['client_id'] as String;
    _privateKey = jsonNotificationServiceDecode['private_key'] as String;
  }

  Future<void> envoiNotification({
    required String uidNotif,
  }) async {
    final firebaseAdmin = FirebaseAdminApp.initializeApp(
      _projectId,
      Credential.fromServiceAccountParams(
        email: _emailCredential,
        clientId: _clientId,
        privateKey: _privateKey,
      ),
    );

    await EnvoiNotificationUsecase(
      icon: _icon,
      messaging: _messaging ?? Messaging(firebaseAdmin),
      firebaseAuth:
          _firebaseAuth ?? FirebaseAuth(_apiKey, firedart.VolatileStore()),
      email: _emailAdmin,
      password: _passwordAdmin,
      notifRepository: _notifRepository ??
          FirestoreNotifRepository(
            firestore: Firestore(
              firebaseAdmin,
              settings: Settings(
                databaseId: _databaseId,
              ),
            ),
            collectionName: _collectionNameNotif,
          ),
      templateRepository: _templateRepository ??
          FirestoreTemplateRepository(
            firestore: Firestore(
              firebaseAdmin,
              settings: Settings(
                databaseId: _databaseId,
              ),
            ),
            collectionName: _collectionNameTemplate,
          ),
    ).execute(
      command: EnvoiNotificationCommand(uidNotif: uidNotif),
    );
  }
}
