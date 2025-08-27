import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'sauvegarde_url_wix_event.dart';
part 'sauvegarde_url_wix_state.dart';

class SauvegardeUrlWixBloc
    extends Bloc<SauvegardeUrlWixEvent, SauvegardeUrlWixState> {
  SauvegardeUrlWixBloc({
    required SauvegardeUrlWixUsecase sauvegardeUrlWixUsecase,
    required String currentUrl,
    required String uid,
  }) : _sauvegardeUrlWixUsecase = sauvegardeUrlWixUsecase,
       _uid = uid,
       super(SauvegardeUrlWixState.initial(currentUrl)) {
    on<SauvegardeUrlWixUrlChanged>(_onUrlChanged);
    on<SauvegardeUrlWixSubmitted>(_onSubmitted);
  }

  final SauvegardeUrlWixUsecase _sauvegardeUrlWixUsecase;
  final String _uid;

  void _onUrlChanged(
    SauvegardeUrlWixUrlChanged event,
    Emitter<SauvegardeUrlWixState> emit,
  ) {
    final url = TextInput.dirty(event.url);
    emit(
      state.copyWith(
        url: url,
        isValid: Formz.validate([url]),
      ),
    );
  }

  Future<void> _onSubmitted(
    SauvegardeUrlWixSubmitted event,
    Emitter<SauvegardeUrlWixState> emit,
  ) async {
    if (!state.isValid) return;

    emit(state.copyWith(status: SauvegardeUrlWixStatus.loading));

    try {
      await _sauvegardeUrlWixUsecase.execute(
        SauvegardeUrlWixCommand(
          url: state.url.value ?? '',
          uid: _uid,
        ),
      );

      emit(state.copyWith(status: SauvegardeUrlWixStatus.success));
    } catch (error) {
      emit(
        state.copyWith(
          status: SauvegardeUrlWixStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
