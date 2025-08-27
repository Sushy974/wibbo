import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wibbo_web/dialog/sauvegarde_site_id_wix/bloc/sauvegarde_site_id_wix_bloc.dart';
import 'package:wibbo_web/dialog/sauvegarde_site_id_wix/view/sauvegarde_site_id_wix_view.dart';

class SauvegardeSiteIdWixPage extends StatelessWidget {
  const SauvegardeSiteIdWixPage({
    super.key,
    required this.currentSiteId,
    required this.uid,
  });

  final String currentSiteId;
  final String uid;

  static Future<void> show(
    BuildContext context, {
    required String currentSiteId,
    required String uid,
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) => SauvegardeSiteIdWixPage(
        currentSiteId: currentSiteId,
        uid: uid,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SauvegardeSiteIdWixBloc(
        sauvegardeSiteIdWixUsecase: SauvegardeSiteIdWixUsecase(
          compteUtilisateurRepository: context.read<CompteUtilisateurRepository>(),
        ),
        currentSiteId: currentSiteId,
        uid: uid,
      ),
      child: const SauvegardeSiteIdWixView(),
    );
  }
}
