import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:wibbo_web/app/app.dart';
import 'package:wibbo_web/bootstrap.dart';
import 'package:wibbo_web/firebase_options.dart';

void main() {
  bootstrap(() async {
    WidgetsFlutterBinding.ensureInitialized();
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory.web,
    );
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    final firestore = FirebaseFirestore.instance;
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CompteUtilisateurRepository>(
          create: (context) => FirestoreCompteUtilisateurRepository(
            firestore: CompteUtilisateurCollectionReference(firestore),
          ),
        ),
        RepositoryProvider<AuthenticationRepository>(
          create: (context) => AuthenticationRepository(),
        ),
      ],
      child: const App(),
    );
  });
}
