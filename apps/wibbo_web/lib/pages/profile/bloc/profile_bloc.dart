import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required AuthenticationRepository authenticationRepository,
    required CompteUtilisateurRepository compteUtilisateurRepository,
  }) : _authenticationRepository = authenticationRepository,
       _compteUtilisateurRepository = compteUtilisateurRepository,
       super(const ProfileState()) {
    on<ProfileStreamUser>(_onStreamUser);
    on<ProfileLoadCompteUtilisateur>(_onLoadCompteUtilisateur);
  }

  final AuthenticationRepository _authenticationRepository;
  final CompteUtilisateurRepository _compteUtilisateurRepository;
  StreamSubscription<User>? _userSubscription;

  Future<void> _onStreamUser(
    ProfileStreamUser event,
    Emitter<ProfileState> emit,
  ) async {
    await emit.forEach(
      _authenticationRepository.user,
      onData: (User user) {
        if (user.isNotEmpty) {
          add(ProfileLoadCompteUtilisateur(userId: user.id));
        }
        return state.copyWith(user: user);
      },
    );
  }

  Future<void> _onLoadCompteUtilisateur(
    ProfileLoadCompteUtilisateur event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(status: ProfileStatus.loading));

    await emit.forEach(
      _compteUtilisateurRepository.getStreamCompteUtilisateurParUid(
        event.userId,
      ),
      onData: (CompteUtilisateur? compteUtilisateur) {
        return state.copyWith(
          status: ProfileStatus.success,
          compteUtilisateur: compteUtilisateur,
        );
      },
    );
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
