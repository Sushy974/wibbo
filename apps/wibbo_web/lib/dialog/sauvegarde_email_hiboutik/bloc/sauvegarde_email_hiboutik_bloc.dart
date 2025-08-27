import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'sauvegarde_email_hiboutik_event.dart';
part 'sauvegarde_email_hiboutik_state.dart';

class SauvegardeEmailHiboutikBloc
    extends Bloc<SauvegardeEmailHiboutikEvent, SauvegardeEmailHiboutikState> {
  SauvegardeEmailHiboutikBloc({
    required SauvegardeEmailHiboutikUsecase sauvegardeEmailHiboutikUsecase,
    required String currentEmail,
    required String uid,
  }) : _sauvegardeEmailHiboutikUsecase = sauvegardeEmailHiboutikUsecase,
       _uid = uid,
       super(SauvegardeEmailHiboutikState.initial(currentEmail)) {
    on<SauvegardeEmailHiboutikEmailChanged>(_onEmailChanged);
    on<SauvegardeEmailHiboutikSubmitted>(_onSubmitted);
  }

  final SauvegardeEmailHiboutikUsecase _sauvegardeEmailHiboutikUsecase;
  final String _uid;

  void _onEmailChanged(
    SauvegardeEmailHiboutikEmailChanged event,
    Emitter<SauvegardeEmailHiboutikState> emit,
  ) {
    final email = EmailInput.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email]),
      ),
    );
  }

  Future<void> _onSubmitted(
    SauvegardeEmailHiboutikSubmitted event,
    Emitter<SauvegardeEmailHiboutikState> emit,
  ) async {
    if (!state.isValid) return;

    emit(state.copyWith(status: SauvegardeEmailHiboutikStatus.loading));

    try {
      await _sauvegardeEmailHiboutikUsecase.execute(
        SauvegardeEmailHiboutikCommand(
          email: state.email.value,
          uid: _uid,
        ),
      );

      emit(state.copyWith(status: SauvegardeEmailHiboutikStatus.success));
    } catch (error) {
      emit(
        state.copyWith(
          status: SauvegardeEmailHiboutikStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
