import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:rxdart/rxdart.dart';

part 'inscription_event.dart';
part 'inscription_state.dart';

EventTransformer<Event> debounceTransformer<Event>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration);
}

class InscriptionBloc extends Bloc<InscriptionEvent, InscriptionState>
    with FormzMixin {
  InscriptionBloc({
    required InscriptionUsecase inscriptionUtilisateurUsecase,
    required VerifieEmailDisponnibleUsecase verifieEmailDisponnibleUsecase,
  }) : _inscriptionUtilisateurUsecase = inscriptionUtilisateurUsecase,
       _verifieEmailDisponnibleUsecase = verifieEmailDisponnibleUsecase,
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
    on<InscriptionShowHiboutikMotDePasseChanged>(
      _onShowHiboutikMotDePasseChanged,
    );
    on<InscriptionUrlHiboutikChanged>(_onUrlHiboutikChanged);
    // Nouveaux gestionnaires pour Wix
    on<InscriptionUrlWixChanged>(_onUrlWixChanged);
    on<InscriptionWixApiKeyChanged>(_onWixApiKeyChanged);
    on<InscriptionWixSiteIdChanged>(_onWixSiteIdChanged);
    on<InscriptionSubmitted>(
      _onSubmitted,
      transformer: droppable(),
    );
    on<InscriptionVerifieEmailDisponnible>(
      _onVerifieEmailDisponnible,
      //transformer: debounceTransformer(const Duration(milliseconds: 5)),
    );
  }

  final InscriptionUsecase _inscriptionUtilisateurUsecase;
  final VerifieEmailDisponnibleUsecase _verifieEmailDisponnibleUsecase;

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
    add(const InscriptionVerifieEmailDisponnible());
    print('event.email: ${event.email}');
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
      emit(state.copyWith(hiboutikApiKey: const TextInput.pure()));
    }
    emit(
      state.copyWith(
        hiboutikApiKey: TextInput.dirty(event.hiboutikMotDePasse),
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
          hiboutikMotDePasse: state.hiboutikApiKey.value ?? '',
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

  FutureOr<void> _onVerifieEmailDisponnible(
    InscriptionVerifieEmailDisponnible event,
    Emitter<InscriptionState> emit,
  ) async {
    final result = await _verifieEmailDisponnibleUsecase.execute(
      VerifieEmailDisponnibleCommand(
        email: state.email.value,
      ),
    );
    print('result: $result');
    emit(state.copyWith(isEmailDisponnible: BoolValide.dirty(result)));
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [
    state.email,
    state.motDePasse,
    state.confirmationMotDePasse,
    state.hiboutikEmail,
    state.hiboutikIdVendeur,
    state.hiboutikApiKey,
    state.urlHiboutik,
    state.urlWix,
    state.wixApiKey,
    state.wixSiteId,
    state.isEmailDisponnible,
  ];
}
