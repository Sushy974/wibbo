// ignore_for_file: public_member_api_docs

import 'package:authentication_repository/authentication_repository.dart';

class ConnexionUsecase {
  ConnexionUsecase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  Future<void> execute(
    ConnexionCommand command,
  ) async {
    await _authenticationRepository.connexionAvecEmailEtMotDePasse(
      email: command.email,
      password: command.password,
    );
  }
}

class ConnexionCommand {
  ConnexionCommand({required this.email, required this.password});
  final String email;
  final String password;
}
