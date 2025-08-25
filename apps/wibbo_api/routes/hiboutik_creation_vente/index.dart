// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dart_firebase_admin/firestore.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:http/http.dart' as http;
import 'package:wibbo_api/extensions.dart';
import 'package:wibbo_api/repository/compte_utilisateur_repository.dart';
import 'package:wibbo_api/repository/hiboutik_repository.dart';
import 'package:wibbo_api/services/normaize_charactere.dart';
import 'package:wibbo_api/services/logger_service.dart';
import 'package:wibbo_api/usecase/creer_vente_hiboutik_usecase.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  LoggerService.info('Requête reçue sur /hiboutik_creation_vente', 'Route');
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
  LoggerService.info('Début du traitement POST /hiboutik_creation_vente', 'Route');
  final firestore = await context.readAsync<Firestore>();

  try {
    // Log du body brut avant parsing JSON
    final rawBody = await context.request.body();
    LoggerService.debug('Body brut reçu: ${rawBody.length} caractères', 'Route');
    
    // Tentative de parsing JSON avec gestion d'erreur améliorée
    Map<String, dynamic> body;
    try {
      body = (await context.request.json()) as Map<String, dynamic>;
      LoggerService.debug('JSON parsé avec succès', 'Route');
    } catch (jsonError) {
      LoggerService.warning('Erreur parsing JSON, tentative de normalisation', 'Route');
      // Tentative de normalisation des caractères spéciaux
      try {
        final normalizedBody = normalizeSpecialCharacters(rawBody);
        body = json.decode(normalizedBody) as Map<String, dynamic>;
        LoggerService.info('JSON normalisé avec succès', 'Route');
      } catch (normalizeError) {
        LoggerService.error('Échec de normalisation JSON', normalizeError, null, 'Route');
        return Response(
          statusCode: HttpStatus.badRequest,
          body: json.encode({
            'error': "Erreur d'encodage des données",
            'message':
                'Impossible de traiter les caractères spéciaux dans les données JSON',
            'details': jsonError.toString(),
            'suggestion': "Vérifiez que votre requête utilise l'encodage UTF-8",
          }),
        );
      }
    }

    // Gestion des deux formats possibles : 'listeItems' ou 'items'

    final listeItemsMapDynamic = body['items'] as List<dynamic>;
    final listeItemsMap =
        listeItemsMapDynamic.map((e) => e as Map<String, dynamic>).toList();
    
    LoggerService.info('Items extraits du body: ${listeItemsMap.length} items', 'Route');

    const uidCompteUtilisateur = 'cEIyZGLZKo2EtN3GqSz3';
    LoggerService.debug('UID utilisateur utilisé: $uidCompteUtilisateur', 'Route');

    LoggerService.info('Exécution du usecase CreerVenteHiboutikUsecase', 'Route');
    await CreerVenteHiboutikUsecase(
      compteUtilisateurRepository: FirestoreCompteUtilisateurRepository(
        firestore: firestore,
      ),
      hiboutikRepository: HiboutikApiRepository(
        httpClient: http.Client(),
      ),
    ).execute(
      CreerVenteHiboutikCommand(
        listeItemsMap: listeItemsMap,
        uidCompteUtilisateur: uidCompteUtilisateur,
      ),
    );
    LoggerService.info('Usecase CreerVenteHiboutikUsecase exécuté avec succès', 'Route');

    LoggerService.info('Réponse de succès envoyée - Status: 202', 'Route');
    return Response(
      statusCode: HttpStatus.accepted,
      body: json.encode({
        'success': true,
        'data': listeItemsMap,
        'message': 'Création de la vente hiboutik ok',
      }),
    );
  } catch (e) {
    LoggerService.error('Erreur lors du traitement de la requête', e, null, 'Route');
    
    if (e is FormatException) {
      LoggerService.warning('Erreur de format détectée', 'Route');
      return Response(
        statusCode: HttpStatus.badRequest,
        body: json.encode({
          'error': "Erreur d'encodage des données",
          'message':
              'Les données reçues contiennent des caractères non valides',
          'details': e.message,
        }),
      );
    }

    LoggerService.error('Erreur interne du serveur', e, null, 'Route');
    return Response(
      statusCode: HttpStatus.internalServerError,
      body: json.encode({
        'error': 'Erreur interne du serveur',
        'message': e.toString(),
      }),
    );
  }
}
