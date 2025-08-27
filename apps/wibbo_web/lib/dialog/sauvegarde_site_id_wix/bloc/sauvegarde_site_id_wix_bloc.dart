import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'sauvegarde_site_id_wix_event.dart';
part 'sauvegarde_site_id_wix_state.dart';

class SauvegardeSiteIdWixBloc
    extends Bloc<SauvegardeSiteIdWixEvent, SauvegardeSiteIdWixState> {
  SauvegardeSiteIdWixBloc({
    required SauvegardeSiteIdWixUsecase sauvegardeSiteIdWixUsecase,
    required String currentSiteId,
    required String uid,
  }) : _sauvegardeSiteIdWixUsecase = sauvegardeSiteIdWixUsecase,
       _uid = uid,
       super(SauvegardeSiteIdWixState.initial(currentSiteId)) {
    on<SauvegardeSiteIdWixSiteIdChanged>(_onSiteIdChanged);
    on<SauvegardeSiteIdWixSubmitted>(_onSubmitted);
  }

  final SauvegardeSiteIdWixUsecase _sauvegardeSiteIdWixUsecase;
  final String _uid;

  void _onSiteIdChanged(
    SauvegardeSiteIdWixSiteIdChanged event,
    Emitter<SauvegardeSiteIdWixState> emit,
  ) {
    final siteId = TextInput.dirty(event.siteId);
    emit(
      state.copyWith(
        siteId: siteId,
        isValid: Formz.validate([siteId]),
      ),
    );
  }

  Future<void> _onSubmitted(
    SauvegardeSiteIdWixSubmitted event,
    Emitter<SauvegardeSiteIdWixState> emit,
  ) async {
    if (!state.isValid) return;

    emit(state.copyWith(status: SauvegardeSiteIdWixStatus.loading));

    try {
      await _sauvegardeSiteIdWixUsecase.execute(
        SauvegardeSiteIdWixCommand(
          siteId: state.siteId.value ?? '',
          uid: _uid,
        ),
      );

      emit(state.copyWith(status: SauvegardeSiteIdWixStatus.success));
    } catch (error) {
      emit(
        state.copyWith(
          status: SauvegardeSiteIdWixStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
