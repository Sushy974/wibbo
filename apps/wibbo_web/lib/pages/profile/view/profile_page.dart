import 'package:authentication_repository/authentication_repository.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wibbo_web/pages/profile/bloc/profile_bloc.dart';
import 'package:wibbo_web/pages/profile/view/profile_view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static Page<void> page() => const MaterialPage<void>(
        name: 'profile',
        child: ProfilePage(),
      );

  static Route<dynamic> route() {
    return MaterialPageRoute<void>(
      settings: const RouteSettings(name: 'profile'),
      builder: (_) => const ProfilePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProfileBloc(
        authenticationRepository: context.read<AuthenticationRepository>(),
        compteUtilisateurRepository: context.read<CompteUtilisateurRepository>(),
      )..add(const ProfileStreamUser()),
      child: const ProfileView(),
    );
  }
}
