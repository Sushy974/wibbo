import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'sauvegarde_id_vendeur_hiboutik_event.dart';
part 'sauvegarde_id_vendeur_hiboutik_state.dart';

class SauvegardeIdVendeurHiboutikBloc
    extends Bloc<SauvegardeIdVendeurHiboutikEvent, SauvegardeIdVendeurHiboutikState> {
  SauvegardeIdVendeurHiboutikBloc({
    required SauvegardeIdVendeurHiboutikUsecase sauvegardeIdVendeurHiboutikUsecase,
    required String currentIdVendeur,
    required String uid,
  }) : _sauvegardeIdVendeurHiboutikUsecase = sauvegardeIdVendeurHiboutikUsecase,
       _uid = uid,
       super(SauvegardeIdVendeurHiboutikState.initial(currentIdVendeur)) {
    on<SauvegardeIdVendeurHiboutikIdChanged>(_onIdVendeurChanged);
    on<SauvegardeIdVendeurHiboutikSubmitted>(_onSubmitted);
  }

  final SauvegardeIdVendeurHiboutikUsecase _sauvegardeIdVendeurHiboutikUsecase;
  final String _uid;

  void _onIdVendeurChanged(
    SauvegardeIdVendeurHiboutikIdChanged event,
    Emitter<SauvegardeIdVendeurHiboutikState> emit,
  ) {
    final idVendeur = TextInput.dirty(event.idVendeur);
    emit(
      state.copyWith(
        idVendeur: idVendeur,
        isValid: Formz.validate([idVendeur]),
      ),
    );
  }

  Future<void> _onSubmitted(
    SauvegardeIdVendeurHiboutikSubmitted event,
    Emitter<SauvegardeIdVendeurHiboutikState> emit,
  ) async {
    if (!state.isValid) return;

    emit(state.copyWith(status: SauvegardeIdVendeurHiboutikStatus.loading));

    try {
      await _sauvegardeIdVendeurHiboutikUsecase.execute(
        SauvegardeIdVendeurHiboutikCommand(
          idVendeur: state.idVendeur.value ?? '',
          uid: _uid,
        ),
      );

      emit(state.copyWith(status: SauvegardeIdVendeurHiboutikStatus.success));
    } catch (error) {
      emit(
        state.copyWith(
          status: SauvegardeIdVendeurHiboutikStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
