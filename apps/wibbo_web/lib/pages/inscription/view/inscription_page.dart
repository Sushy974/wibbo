import 'package:authentication_repository/authentication_repository.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wibbo_web/pages/inscription/bloc/inscription_bloc.dart';
import 'package:wibbo_web/pages/inscription/view/inscription_view.dart';

class InscriptionPage extends StatelessWidget {
  const InscriptionPage({super.key});

  static Page<void> page() => const MaterialPage<void>(
    name: 'inscription',
    child: InscriptionPage(),
  );

  static Route<dynamic> route() {
    return MaterialPageRoute<void>(
      settings: const RouteSettings(name: 'inscription'),
      builder: (_) => const InscriptionPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => InscriptionBloc(
        inscriptionUtilisateurUsecase: InscriptionUsecase(
          authenticationRepository: context.read<AuthenticationRepository>(),
          compteUtilisateurRepository: context
              .read<CompteUtilisateurRepository>(),
        ),
      ),
      child: const InscriptionView(),
    );
  }
}
