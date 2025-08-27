import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wibbo_web/dialog/sauvegarde_api_key_wix/bloc/sauvegarde_api_key_wix_bloc.dart';
import 'package:wibbo_web/dialog/sauvegarde_api_key_wix/view/sauvegarde_api_key_wix_view.dart';

class SauvegardeApiKeyWixPage extends StatelessWidget {
  const SauvegardeApiKeyWixPage({
    super.key,
    required this.currentApiKey,
    required this.uid,
  });

  final String currentApiKey;
  final String uid;

  static Future<void> show(
    BuildContext context, {
    required String currentApiKey,
    required String uid,
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) => SauvegardeApiKeyWixPage(
        currentApiKey: currentApiKey,
        uid: uid,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SauvegardeApiKeyWixBloc(
        sauvegardeApiKeyWixUsecase: SauvegardeApiKeyWixUsecase(
          compteUtilisateurRepository: context.read<CompteUtilisateurRepository>(),
        ),
        currentApiKey: currentApiKey,
        uid: uid,
      ),
      child: const SauvegardeApiKeyWixView(),
    );
  }
}
