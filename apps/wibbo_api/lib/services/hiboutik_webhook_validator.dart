// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:wibbo_api/services/logger_service.dart';

class HiboutikWebhookValidator {
  static const String _expectedUserAgent = 'HiboutikCallBack';
  
  /// Vérifie si la requête provient d'Hiboutik en validant le User-Agent
  static bool isValidHiboutikRequest(Request request) {
    final userAgent = request.headers['user-agent'] ?? '';
    
    LoggerService.info(
      'Vérification User-Agent: "$userAgent"',
      'HiboutikWebhookValidator'
    );
    
    final isValid = userAgent.contains(_expectedUserAgent);
    
    if (!isValid) {
      LoggerService.warning(
        'User-Agent invalide: "$userAgent" - Attendu: "$_expectedUserAgent"',
        'HiboutikWebhookValidator'
      );
    } else {
      LoggerService.info(
        'User-Agent valide confirmé',
        'HiboutikWebhookValidator',
      );
    }
    
    return isValid;
  }
  
  /// Retourne une réponse d'erreur 403 si la requête n'est pas valide
  static Response? validateRequest(Request request) {
    if (!isValidHiboutikRequest(request)) {
      return Response(
        statusCode: HttpStatus.forbidden,
        body: '{"error": "Accès non autorisé", "message": "User-Agent invalide"}',
        headers: {'content-type': 'application/json'},
      );
    }
    return null;
  }
}
