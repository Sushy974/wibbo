import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'connexion_event.dart';
part 'connexion_state.dart';

class ConnexionBloc extends Bloc<ConnexionEvent, ConnexionState>
    with FormzMixin {
  ConnexionBloc({
    required ConnexionUsecase connexionUtilisateurUsecase,
  }) : _connexionUtilisateurUsecase = connexionUtilisateurUsecase,
       super(const ConnexionState()) {
    on<ConnexionEmailChanged>(_onEmailChanged);
    on<ConnexionMotDePasseChanged>(_onMotDePasseChanged);
    on<ConnexionShowMotDePasseChanged>(_onShowMotDePasseChanged);
    on<ConnexionSubmitted>(
      _onSubmitted,
      transformer: droppable(),
    );
  }

  final ConnexionUsecase _connexionUtilisateurUsecase;

  FutureOr<void> _onEmailChanged(
    ConnexionEmailChanged event,
    Emitter<ConnexionState> emit,
  ) {
    if (event.email == '') {
      emit(state.copyWith(email: const EmailInput.pure()));
    }
    emit(
      state.copyWith(
        email: EmailInput.dirty(event.email),
      ),
    );
  }

  FutureOr<void> _onMotDePasseChanged(
    ConnexionMotDePasseChanged event,
    Emitter<ConnexionState> emit,
  ) {
    if (event.motDePasse == '') {
      emit(state.copyWith(motDePasse: const MotDePasseInput.pure()));
    }
    emit(
      state.copyWith(
        motDePasse: MotDePasseInput.dirty(event.motDePasse),
      ),
    );
  }

  FutureOr<void> _onShowMotDePasseChanged(
    ConnexionShowMotDePasseChanged event,
    Emitter<ConnexionState> emit,
  ) {
    emit(
      state.copyWith(
        motDePasseVisible: !state.motDePasseVisible,
      ),
    );
  }

  FutureOr<void> _onSubmitted(
    ConnexionSubmitted event,
    Emitter<ConnexionState> emit,
  ) async {
    try {
      if (isNotValid) return;

      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

      await _connexionUtilisateurUsecase.execute(
        ConnexionCommand(
          email: state.email.value,
          password: state.motDePasse.value,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
        ),
      );
    }
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [
    state.email,
    state.motDePasse,
  ];
}
