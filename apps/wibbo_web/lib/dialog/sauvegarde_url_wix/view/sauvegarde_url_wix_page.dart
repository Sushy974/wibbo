import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wibbo_web/dialog/sauvegarde_url_wix/bloc/sauvegarde_url_wix_bloc.dart';
import 'package:wibbo_web/dialog/sauvegarde_url_wix/view/sauvegarde_url_wix_view.dart';

class SauvegardeUrlWixPage extends StatelessWidget {
  const SauvegardeUrlWixPage({
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
      builder: (context) => SauvegardeUrlWixPage(
        currentUrl: currentUrl,
        uid: uid,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SauvegardeUrlWixBloc(
        sauvegardeUrlWixUsecase: SauvegardeUrlWixUsecase(
          compteUtilisateurRepository: context.read<CompteUtilisateurRepository>(),
        ),
        currentUrl: currentUrl,
        uid: uid,
      ),
      child: const SauvegardeUrlWixView(),
    );
  }
}
