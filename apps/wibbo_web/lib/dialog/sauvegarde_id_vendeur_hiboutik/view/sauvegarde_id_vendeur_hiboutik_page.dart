import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wibbo_web/dialog/sauvegarde_id_vendeur_hiboutik/bloc/sauvegarde_id_vendeur_hiboutik_bloc.dart';
import 'package:wibbo_web/dialog/sauvegarde_id_vendeur_hiboutik/view/sauvegarde_id_vendeur_hiboutik_view.dart';

class SauvegardeIdVendeurHiboutikPage extends StatelessWidget {
  const SauvegardeIdVendeurHiboutikPage({
    super.key,
    required this.currentIdVendeur,
    required this.uid,
  });

  final String currentIdVendeur;
  final String uid;

  static Future<void> show(
    BuildContext context, {
    required String currentIdVendeur,
    required String uid,
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) => SauvegardeIdVendeurHiboutikPage(
        currentIdVendeur: currentIdVendeur,
        uid: uid,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SauvegardeIdVendeurHiboutikBloc(
        sauvegardeIdVendeurHiboutikUsecase: SauvegardeIdVendeurHiboutikUsecase(
          compteUtilisateurRepository: context.read<CompteUtilisateurRepository>(),
        ),
        currentIdVendeur: currentIdVendeur,
        uid: uid,
      ),
      child: const SauvegardeIdVendeurHiboutikView(),
    );
  }
}
