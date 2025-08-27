import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wibbo_web/dialog/sauvegarde_email_hiboutik/bloc/sauvegarde_email_hiboutik_bloc.dart';
import 'package:wibbo_web/dialog/sauvegarde_email_hiboutik/view/sauvegarde_email_hiboutik_view.dart';

class SauvegardeEmailHiboutikPage extends StatelessWidget {
  const SauvegardeEmailHiboutikPage({
    super.key,
    required this.currentEmail,
    required this.uid,
  });

  final String currentEmail;
  final String uid;

  static Future<void> show(
    BuildContext context, {
    required String currentEmail,
    required String uid,
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) => SauvegardeEmailHiboutikPage(
        currentEmail: currentEmail,
        uid: uid,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SauvegardeEmailHiboutikBloc(
        sauvegardeEmailHiboutikUsecase: SauvegardeEmailHiboutikUsecase(
          compteUtilisateurRepository: context
              .read<CompteUtilisateurRepository>(),
        ),
        currentEmail: currentEmail,
        uid: uid,
      ),
      child: const SauvegardeEmailHiboutikView(),
    );
  }
}
