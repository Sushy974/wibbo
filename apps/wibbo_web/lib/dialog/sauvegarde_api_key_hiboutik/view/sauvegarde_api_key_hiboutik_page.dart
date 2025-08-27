import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';
import 'package:wibbo_web/dialog/sauvegarde_api_key_hiboutik/bloc/sauvegarde_api_key_hiboutik_bloc.dart';
import 'package:wibbo_web/dialog/sauvegarde_api_key_hiboutik/view/sauvegarde_api_key_hiboutik_view.dart';

class SauvegardeApiKeyHiboutikPage extends StatelessWidget {
  const SauvegardeApiKeyHiboutikPage({
    super.key,
    required this.currentApiKey,
    required this.uid,
  });

  final String currentApiKey;
  final String uid;

  static void show(
    BuildContext context, {
    required String currentApiKey,
    required String uid,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => SauvegardeApiKeyHiboutikPage(
        currentApiKey: currentApiKey,
        uid: uid,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SauvegardeApiKeyHiboutikBloc(
        authenticationRepository: context.read<AuthenticationRepository>(),
        sauvegardeApiKeyHiboutikUsecase: SauvegardeApiKeyHiboutikUsecase(
          compteUtilisateurRepository: context
              .read<CompteUtilisateurRepository>(),
        ),
      )..add(SauvegardeApiKeyHiboutikApiKeyChanged(currentApiKey)),
      child: SauvegardeApiKeyHiboutikView(
        currentApiKey: currentApiKey,
        uid: uid,
      ),
    );
  }
}
