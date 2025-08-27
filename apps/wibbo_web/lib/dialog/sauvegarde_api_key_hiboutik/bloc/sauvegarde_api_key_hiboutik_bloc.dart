import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';

part 'sauvegarde_api_key_hiboutik_event.dart';
part 'sauvegarde_api_key_hiboutik_state.dart';

class SauvegardeApiKeyHiboutikBloc
    extends Bloc<SauvegardeApiKeyHiboutikEvent, SauvegardeApiKeyHiboutikState> {
  SauvegardeApiKeyHiboutikBloc({
    required SauvegardeApiKeyHiboutikUsecase sauvegardeApiKeyHiboutikUsecase,
    required AuthenticationRepository authenticationRepository,
  }) : _sauvegardeApiKeyHiboutikUsecase = sauvegardeApiKeyHiboutikUsecase,
       _authenticationRepository = authenticationRepository,
       super(const SauvegardeApiKeyHiboutikState()) {
    on<SauvegardeApiKeyHiboutikApiKeyChanged>(_onApiKeyChanged);
    on<SauvegardeApiKeyHiboutikSubmitted>(_onSubmitted);
  }

  final SauvegardeApiKeyHiboutikUsecase _sauvegardeApiKeyHiboutikUsecase;
  final AuthenticationRepository _authenticationRepository;

  void _onApiKeyChanged(
    SauvegardeApiKeyHiboutikApiKeyChanged event,
    Emitter<SauvegardeApiKeyHiboutikState> emit,
  ) {
    final apiKey = TextInput.dirty(event.apiKey);
    emit(
      state.copyWith(
        apiKey: apiKey,
        isValid: apiKey.isValid,
      ),
    );
  }

  Future<void> _onSubmitted(
    SauvegardeApiKeyHiboutikSubmitted event,
    Emitter<SauvegardeApiKeyHiboutikState> emit,
  ) async {
    if (!state.isValid) return;

    emit(state.copyWith(status: SauvegardeApiKeyHiboutikStatus.loading));

    try {
      print('state.uid: ${state.uid}');
      final uid = _authenticationRepository.currentUser.id;
      await _sauvegardeApiKeyHiboutikUsecase.execute(
        SauvegardeApiKeyHiboutikCommand(
          uid: uid,
          apiKeyHiboutik: state.apiKey.value ?? '',
        ),
      );
      emit(state.copyWith(status: SauvegardeApiKeyHiboutikStatus.success));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: SauvegardeApiKeyHiboutikStatus.failure));
      addError(error, stackTrace);
    }
  }
}
