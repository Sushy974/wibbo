import 'package:flutter/material.dart';
import 'package:wibbo_web/app/bloc/app_bloc.dart';
import 'package:wibbo_web/pages/connexion/view/connexion_page.dart';
import 'package:wibbo_web/pages/inscription/view/inscription_page.dart';
import 'package:wibbo_web/pages/profile/view/profile_page.dart';

List<Page<dynamic>> onGenerateAppDestinationViewPages(
  AppState state,
  List<Page<dynamic>> pages,
) {
  if (state.user.isEmpty) {
    if (state.authenticationNavigation.isPageConnexion) {
      return [
        ConnexionPage.page(),
      ];
    }
    if (state.authenticationNavigation.isPageInscription) {
      return [
        InscriptionPage.page(),
      ];
    }
    if (state.authenticationNavigation.isPageBienvenue) {
      return [
        ProfilePage.page(),
      ];
    }
  }
  return [
    ConnexionPage.page(),
  ];
}
