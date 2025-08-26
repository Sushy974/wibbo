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
    // Nouveaux gestionnaires pour Hiboutik
    on<InscriptionHiboutikEmailChanged>(_onHiboutikEmailChanged);
    on<InscriptionHiboutikIdVendeurChanged>(_onHiboutikIdVendeurChanged);
    on<InscriptionHiboutikMotDePasseChanged>(_onHiboutikMotDePasseChanged);
    on<InscriptionShowHiboutikMotDePasseChanged>(_onShowHiboutikMotDePasseChanged);
    on<InscriptionUrlHiboutikChanged>(_onUrlHiboutikChanged);
    // Nouveaux gestionnaires pour Wix
    on<InscriptionUrlWixChanged>(_onUrlWixChanged);
    on<InscriptionWixApiKeyChanged>(_onWixApiKeyChanged);
    on<InscriptionWixSiteIdChanged>(_onWixSiteIdChanged);
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

  // Nouveaux gestionnaires pour Hiboutik
  FutureOr<void> _onHiboutikEmailChanged(
    InscriptionHiboutikEmailChanged event,
    Emitter<InscriptionState> emit,
  ) {
    if (event.hiboutikEmail == '') {
      emit(state.copyWith(hiboutikEmail: const EmailInput.pure()));
    }
    emit(
      state.copyWith(
        hiboutikEmail: EmailInput.dirty(event.hiboutikEmail),
      ),
    );
  }

  FutureOr<void> _onHiboutikIdVendeurChanged(
    InscriptionHiboutikIdVendeurChanged event,
    Emitter<InscriptionState> emit,
  ) {
    if (event.hiboutikIdVendeur == '') {
      emit(state.copyWith(hiboutikIdVendeur: const TextInput.pure()));
    }
    emit(
      state.copyWith(
        hiboutikIdVendeur: TextInput.dirty(event.hiboutikIdVendeur),
      ),
    );
  }

  FutureOr<void> _onHiboutikMotDePasseChanged(
    InscriptionHiboutikMotDePasseChanged event,
    Emitter<InscriptionState> emit,
  ) {
    if (event.hiboutikMotDePasse == '') {
      emit(state.copyWith(hiboutikMotDePasse: const MotDePasseInput.pure()));
    }
    emit(
      state.copyWith(
        hiboutikMotDePasse: MotDePasseInput.dirty(event.hiboutikMotDePasse),
      ),
    );
  }

  FutureOr<void> _onShowHiboutikMotDePasseChanged(
    InscriptionShowHiboutikMotDePasseChanged event,
    Emitter<InscriptionState> emit,
  ) {
    emit(
      state.copyWith(
        hiboutikMotDePasseVisible: !state.hiboutikMotDePasseVisible,
      ),
    );
  }

  FutureOr<void> _onUrlHiboutikChanged(
    InscriptionUrlHiboutikChanged event,
    Emitter<InscriptionState> emit,
  ) {
    if (event.urlHiboutik == '') {
      emit(state.copyWith(urlHiboutik: const TextInput.pure()));
    }
    emit(
      state.copyWith(
        urlHiboutik: TextInput.dirty(event.urlHiboutik),
      ),
    );
  }

  // Nouveaux gestionnaires pour Wix
  FutureOr<void> _onUrlWixChanged(
    InscriptionUrlWixChanged event,
    Emitter<InscriptionState> emit,
  ) {
    if (event.urlWix == '') {
      emit(state.copyWith(urlWix: const TextInput.pure()));
    }
    emit(
      state.copyWith(
        urlWix: TextInput.dirty(event.urlWix),
      ),
    );
  }

  FutureOr<void> _onWixApiKeyChanged(
    InscriptionWixApiKeyChanged event,
    Emitter<InscriptionState> emit,
  ) {
    if (event.wixApiKey == '') {
      emit(state.copyWith(wixApiKey: const TextInput.pure()));
    }
    emit(
      state.copyWith(
        wixApiKey: TextInput.dirty(event.wixApiKey),
      ),
    );
  }

  FutureOr<void> _onWixSiteIdChanged(
    InscriptionWixSiteIdChanged event,
    Emitter<InscriptionState> emit,
  ) {
    if (event.wixSiteId == '') {
      emit(state.copyWith(wixSiteId: const TextInput.pure()));
    }
    emit(
      state.copyWith(
        wixSiteId: TextInput.dirty(event.wixSiteId),
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
          hiboutikEmail: state.hiboutikEmail.value,
          hiboutikIdVendeur: state.hiboutikIdVendeur.value ?? '',
          hiboutikMotDePasse: state.hiboutikMotDePasse.value,
          urlWix: state.urlWix.value ?? '',
          wixApiKey: state.wixApiKey.value ?? '',
          wixSiteId: state.wixSiteId.value ?? '',
          urlHiboutik: state.urlHiboutik.value ?? '',
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
    state.hiboutikEmail,
    state.hiboutikIdVendeur,
    state.hiboutikMotDePasse,
    state.urlHiboutik,
    state.urlWix,
    state.wixApiKey,
    state.wixSiteId,
  ];
}
