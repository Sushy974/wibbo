import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'sauvegarde_api_key_wix_event.dart';
part 'sauvegarde_api_key_wix_state.dart';

class SauvegardeApiKeyWixBloc
    extends Bloc<SauvegardeApiKeyWixEvent, SauvegardeApiKeyWixState> {
  SauvegardeApiKeyWixBloc({
    required SauvegardeApiKeyWixUsecase sauvegardeApiKeyWixUsecase,
    required String currentApiKey,
    required String uid,
  }) : _sauvegardeApiKeyWixUsecase = sauvegardeApiKeyWixUsecase,
       _uid = uid,
       super(SauvegardeApiKeyWixState.initial(currentApiKey)) {
    on<SauvegardeApiKeyWixApiKeyChanged>(_onApiKeyChanged);
    on<SauvegardeApiKeyWixSubmitted>(_onSubmitted);
  }

  final SauvegardeApiKeyWixUsecase _sauvegardeApiKeyWixUsecase;
  final String _uid;

  void _onApiKeyChanged(
    SauvegardeApiKeyWixApiKeyChanged event,
    Emitter<SauvegardeApiKeyWixState> emit,
  ) {
    final apiKey = TextInput.dirty(event.apiKey);
    emit(
      state.copyWith(
        apiKey: apiKey,
        isValid: Formz.validate([apiKey]),
      ),
    );
  }

  Future<void> _onSubmitted(
    SauvegardeApiKeyWixSubmitted event,
    Emitter<SauvegardeApiKeyWixState> emit,
  ) async {
    if (!state.isValid) return;

    emit(state.copyWith(status: SauvegardeApiKeyWixStatus.loading));

    try {
      await _sauvegardeApiKeyWixUsecase.execute(
        SauvegardeApiKeyWixCommand(
          apiKey: state.apiKey.value ?? '',
          uid: _uid,
        ),
      );

      emit(state.copyWith(status: SauvegardeApiKeyWixStatus.success));
    } catch (error) {
      emit(
        state.copyWith(
          status: SauvegardeApiKeyWixStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
