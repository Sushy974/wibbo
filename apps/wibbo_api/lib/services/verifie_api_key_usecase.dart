import 'package:wibbo_api/middlewares.dart';

class VerifieApiKeyUsecase {
  const VerifieApiKeyUsecase();

  bool execute({required VerifieApiKeyCommand command}) {
    final apiKey = command.body['apiKey'] as String?;

    if (apiKey == null) {
      return false;
    }

    return apiKey == apiKeyDuJour(command.body['compte_id'] as String);
  }
}

class VerifieApiKeyCommand {
  const VerifieApiKeyCommand({
    required this.body,
  });

  final Map<String, dynamic> body;
}
