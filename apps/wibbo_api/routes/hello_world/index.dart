// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:wibbo_api/services/logger_service.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  LoggerService.info('Requête reçue sur /hello_world', 'Route');
  LoggerService.debug('Méthode HTTP: ${context.request.method}', 'Route');
  
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context);
    case HttpMethod.post:
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      LoggerService.warning('Méthode HTTP non autorisée: ${context.request.method}', 'Route');
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context) async {
  LoggerService.info('Traitement GET /hello_world', 'Route');
  LoggerService.info('Réponse Hello World envoyée', 'Route');
  
  return Response(
    statusCode: HttpStatus.accepted,
    body: 'Hello World',
  );
}
