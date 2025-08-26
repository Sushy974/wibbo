import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends HydratedBloc<AppEvent, AppState> {
  AppBloc({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository,

       super(const AppState()) {
    on<AppStreamUser>(_onStreamUser);
    on<AppUserChanged>(_onUserChanged);
    on<AppDeconnexion>(_onDeconnexion, transformer: droppable());
    on<AppAuthenticationNavigationChanged>(_onAuthenticationNavigationChanged);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onStreamUser(
    AppStreamUser event,
    Emitter<AppState> emit,
  ) async {
    await emit.forEach(
      _authenticationRepository.user,
      onData: (data) {
        add(const AppAuthenticationNavigationChanged());
        return state.copyWith(
          user: data,
        );
      },
    );
  }

  FutureOr<void> _onAuthenticationNavigationChanged(
    AppAuthenticationNavigationChanged event,
    Emitter<AppState> emit,
  ) {
    if (event.authenticationNavigation != null) {
      emit(
        state.copyWith(
          authenticationNavigation: event.authenticationNavigation,
        ),
      );
      return null;
    }
    if (state.user.isEmpty) {
      emit(
        state.copyWith(
          authenticationNavigation: AuthenticationNavigation.pageConnexion,
        ),
      );
      return null;
    }
    emit(
      state.copyWith(
        authenticationNavigation: AuthenticationNavigation.pageBienvenue,
      ),
    );
  }

  Future<void> _onUserChanged(
    AppUserChanged event,
    Emitter<AppState> emit,
  ) async {
    emit(state.copyWith(user: event.user));
  }

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    final user = User.fromJson(json['user'] as Map<String, dynamic>);

    return AppState(
      authenticationNavigation: user.isNotEmpty
          ? AuthenticationNavigationX.fromJson(
              (json['authenticationNavigation']
                      as Map<String, dynamic>)['authenticationNavigation']
                  as String,
            )
          : AuthenticationNavigation.pageBienvenue,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  @override
  Map<String, dynamic>? toJson(AppState state) {
    return {
      'authenticationNavigation': state.authenticationNavigation.toJson(),
      'user': state.user.toJson(),
    };
  }

  Future<void> _onDeconnexion(
    AppDeconnexion event,
    Emitter<AppState> emit,
  ) async {}
}
