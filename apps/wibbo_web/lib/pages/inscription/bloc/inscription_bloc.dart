import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'inscription_event.dart';
part 'inscription_state.dart';

class InscriptionBloc extends Bloc<InscriptionEvent, InscriptionState>
    with FormzMixin {
  InscriptionBloc({
    required InscriptionUsecase inscriptionUtilisateurUsecase,
  }) : _inscriptionUtilisateurUsecase = inscriptionUtilisateurUsecase,
       super(const InscriptionState()) {
    on<InscriptionEmailChanged>(_onEmailChanged);
    on<InscriptionMotDePasseChanged>(_onMotDePasseChanged);
    on<InscriptionConfirmationMotDePasseChanged>(
      _onConfirmationMotDePasseChanged,
    );
    on<InscriptionShowMotDePasseChanged>(_onShowMotDePasseChanged);
    on<InscriptionShowConfirmationMotDePasseChanged>(
      _onShowConfirmationMotDePasseChanged,
    );
    on<InscriptionSubmitted>(
      _onSubmitted,
      transformer: droppable(),
    );
  }

  final InscriptionUsecase _inscriptionUtilisateurUsecase;

  FutureOr<void> _onEmailChanged(
    InscriptionEmailChanged event,
    Emitter<InscriptionState> emit,
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
    InscriptionMotDePasseChanged event,
    Emitter<InscriptionState> emit,
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

  FutureOr<void> _onConfirmationMotDePasseChanged(
    InscriptionConfirmationMotDePasseChanged event,
    Emitter<InscriptionState> emit,
  ) {
    if (event.confirmationMotDePasse == '') {
      emit(
        state.copyWith(confirmationMotDePasse: const MotDePasseInput.pure()),
      );
    }
    emit(
      state.copyWith(
        confirmationMotDePasse: MotDePasseInput.dirty(
          event.confirmationMotDePasse,
        ),
      ),
    );
  }

  FutureOr<void> _onShowMotDePasseChanged(
    InscriptionShowMotDePasseChanged event,
    Emitter<InscriptionState> emit,
  ) {
    emit(
      state.copyWith(
        motDePasseVisible: !state.motDePasseVisible,
      ),
    );
  }

  FutureOr<void> _onShowConfirmationMotDePasseChanged(
    InscriptionShowConfirmationMotDePasseChanged event,
    Emitter<InscriptionState> emit,
  ) {
    emit(
      state.copyWith(
        confirmationMotDePasseVisible: !state.confirmationMotDePasseVisible,
      ),
    );
  }

  FutureOr<void> _onSubmitted(
    InscriptionSubmitted event,
    Emitter<InscriptionState> emit,
  ) async {
    try {
      if (isNotValid) return;

      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

      await _inscriptionUtilisateurUsecase.execute(
        InscriptionCommande(
          email: state.email.value,
          password: state.motDePasse.value,
          hiboutikEmail: '',
          hiboutikIdVendeur: '',
          hiboutikMotDePasse: '',
          urlWix: '',
          wixApiKey: '',
          wixSiteId: '',
          urlHiboutik: '',
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
    state.confirmationMotDePasse,
  ];
}
