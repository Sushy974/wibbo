import 'package:authentication_repository/authentication_repository.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wibbo_web/app/bloc/app_bloc.dart';
import 'package:wibbo_web/pages/connexion/bloc/connexion_bloc.dart';
import 'package:wibbo_web/pages/connexion/view/connexion_view.dart';

class ConnexionPage extends StatelessWidget {
  const ConnexionPage({super.key});

  static Page<void> page() => const MaterialPage<void>(
    name: 'connexion',
    child: ConnexionPage(),
  );

  static Route<dynamic> route() {
    return MaterialPageRoute<void>(
      settings: const RouteSettings(name: 'connexion'),
      builder: (_) => const ConnexionPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ConnexionBloc(
        connexionUtilisateurUsecase: ConnexionUsecase(
          authenticationRepository: context.read<AuthenticationRepository>(),
        ),
        appBloc: context.read<AppBloc>(),
      ),
      child: const ConnexionView(),
    );
  }
}
