import 'package:authentication_repository/authentication_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wibbo_web/app/bloc/app_bloc.dart';
import 'package:wibbo_web/app/route/route.dart';
import 'package:wibbo_web/app/theme/theme.dart';
import 'package:wibbo_web/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(
        authenticationRepository: context.read<AuthenticationRepository>(),
      )..add(const AppStreamUser()),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            theme: AuroraTheme.theme,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: FlowBuilder(
              onGeneratePages: onGenerateAppDestinationViewPages,
              state: context.select((AppBloc bloc) => bloc.state),
            ),
          );
        },
      ),
    );
  }
}
