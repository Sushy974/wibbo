// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dart_firebase_admin/firestore.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:wibbo_api/extensions.dart';
import 'package:wibbo_api/repository/compte_utilisateur_repository.dart';
import 'package:wibbo_api/repository/wix_repository.dart';
import 'package:wibbo_api/services/hiboutik_webhook_validator.dart';
import 'package:wibbo_api/services/logger_service.dart';
import 'package:wibbo_api/services/query_to_json.dart';
import 'package:wibbo_api/usecase/decremente_stock_wix_usecase.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  LoggerService.info('Requête reçue sur /wix_decremente_stock', 'Route');
  LoggerService.debug('Méthode HTTP: ${context.request.method}', 'Route');
  
  switch (context.request.method) {
    case HttpMethod.get:
    case HttpMethod.post:
      return _post(context);
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      LoggerService.warning('Méthode HTTP non autorisée: ${context.request.method}', 'Route');
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _post(RequestContext context) async {
  LoggerService.info('Début du traitement POST /wix_decremente_stock', 'Route');
  
  // Vérification que la requête provient d'Hiboutik
  final validationError = HiboutikWebhookValidator.validateRequest(context.request);
  if (validationError != null) {
    LoggerService.warning('Requête rejetée - User-Agent invalide', 'Route');
    return validationError;
  }
  
  final firestore = await context.readAsync<Firestore>();
  const uidCompteUtilisateur = 'cEIyZGLZKo2EtN3GqSz3';
  LoggerService.debug('UID utilisateur utilisé: $uidCompteUtilisateur', 'Route');

  try {
    // Log du body brut avant parsing
    final rawBody = await context.request.body();
    LoggerService.debug('Body brut reçu: ${rawBody.length} caractères', 'Route');
    LoggerService.debug('Body brut contenu: $rawBody', 'Route');
    
    // Utiliser directement le body brut comme query string
    final query = rawBody;
    LoggerService.debug('Query reçue: $query', 'Route');
    
    final jsonReponse = queryToJson(query);
    LoggerService.info('Query convertie en JSON avec succès', 'Route');

    LoggerService.info('Exécution du usecase DecrementeStockWixUsecase', 'Route');
    final usecase = DecrementeStockWixUsecase(
      wixRepository: WixAPIVOneRepository(),
      compteUtilisateurRepository: FirestoreCompteUtilisateurRepository(
        firestore: firestore,
      ),
    );
    await usecase.execute(DecrementeStockWixCommand(
      jsonReponse: jsonReponse,
      uidCompteUtilisateur: uidCompteUtilisateur,
    ));
    LoggerService.info('Usecase DecrementeStockWixUsecase exécuté avec succès', 'Route');

    LoggerService.info('Réponse de succès envoyée', 'Route');
    return Response(
      body: json.encode({
        'success': true,
        'data': jsonReponse,
        'message': 'Decrementation du stock wix ok',
      }),
    );
  } catch (e) {
    LoggerService.error('Erreur lors du traitement de la requête', e, null, 'Route');
    return Response(
      statusCode: HttpStatus.internalServerError,
      body: json.encode({
        'error': 'Erreur lors de la conversion de la requête en JSON',
        'details': e.toString(),
      }),
    );
  }
}
