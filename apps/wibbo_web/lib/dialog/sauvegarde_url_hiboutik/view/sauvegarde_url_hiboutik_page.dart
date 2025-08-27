import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wibbo_web/dialog/sauvegarde_url_hiboutik/bloc/sauvegarde_url_hiboutik_bloc.dart';
import 'package:wibbo_web/dialog/sauvegarde_url_hiboutik/view/sauvegarde_url_hiboutik_view.dart';

class SauvegardeUrlHiboutikPage extends StatelessWidget {
  const SauvegardeUrlHiboutikPage({
    super.key,
    required this.currentUrl,
    required this.uid,
  });

  final String currentUrl;
  final String uid;

  static Future<void> show(
    BuildContext context, {
    required String currentUrl,
    required String uid,
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) => SauvegardeUrlHiboutikPage(
        currentUrl: currentUrl,
        uid: uid,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SauvegardeUrlHiboutikBloc(
        sauvegardeUrlHiboutikUsecase: SauvegardeUrlHiboutikUsecase(
          compteUtilisateurRepository: context
              .read<CompteUtilisateurRepository>(),
        ),
        currentUrl: currentUrl,
        uid: uid,
      ),
      child: const SauvegardeUrlHiboutikView(),
    );
  }
}
