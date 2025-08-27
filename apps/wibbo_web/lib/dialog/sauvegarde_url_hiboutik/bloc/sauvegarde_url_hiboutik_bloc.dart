import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'sauvegarde_url_hiboutik_event.dart';
part 'sauvegarde_url_hiboutik_state.dart';

class SauvegardeUrlHiboutikBloc
    extends Bloc<SauvegardeUrlHiboutikEvent, SauvegardeUrlHiboutikState> {
  SauvegardeUrlHiboutikBloc({
    required SauvegardeUrlHiboutikUsecase sauvegardeUrlHiboutikUsecase,
    required String currentUrl,
    required String uid,
  }) : _sauvegardeUrlHiboutikUsecase = sauvegardeUrlHiboutikUsecase,
       _uid = uid,
       super(SauvegardeUrlHiboutikState.initial(currentUrl)) {
    on<SauvegardeUrlHiboutikUrlChanged>(_onUrlChanged);
    on<SauvegardeUrlHiboutikSubmitted>(_onSubmitted);
  }

  final SauvegardeUrlHiboutikUsecase _sauvegardeUrlHiboutikUsecase;
  final String _uid;

  void _onUrlChanged(
    SauvegardeUrlHiboutikUrlChanged event,
    Emitter<SauvegardeUrlHiboutikState> emit,
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
    SauvegardeUrlHiboutikSubmitted event,
    Emitter<SauvegardeUrlHiboutikState> emit,
  ) async {
    if (!state.isValid) return;

    emit(state.copyWith(status: SauvegardeUrlHiboutikStatus.loading));

    try {
      await _sauvegardeUrlHiboutikUsecase.execute(
        SauvegardeUrlHiboutikCommand(
          url: state.url.value ?? '',
          uid: _uid,
        ),
      );

      emit(state.copyWith(status: SauvegardeUrlHiboutikStatus.success));
    } catch (error) {
      emit(
        state.copyWith(
          status: SauvegardeUrlHiboutikStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
