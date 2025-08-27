part of 'sauvegarde_site_id_wix_bloc.dart';

enum SauvegardeSiteIdWixStatus {
  initial,
  loading,
  success,
  failure,
}

class SauvegardeSiteIdWixState extends Equatable {
  const SauvegardeSiteIdWixState({
    this.status = SauvegardeSiteIdWixStatus.initial,
    this.siteId = const TextInput.pure(),
    this.isValid = false,
    this.errorMessage,
  });

  factory SauvegardeSiteIdWixState.initial(String currentSiteId) {
    return SauvegardeSiteIdWixState(
      siteId: TextInput.dirty(currentSiteId),
      isValid: TextInput.dirty(currentSiteId).isValid,
    );
  }

  final SauvegardeSiteIdWixStatus status;
  final TextInput siteId;
  final bool isValid;
  final String? errorMessage;

  bool get isLoading => status == SauvegardeSiteIdWixStatus.loading;
  bool get isSuccess => status == SauvegardeSiteIdWixStatus.success;
  bool get isFailure => status == SauvegardeSiteIdWixStatus.failure;

  SauvegardeSiteIdWixState copyWith({
    SauvegardeSiteIdWixStatus? status,
    TextInput? siteId,
    bool? isValid,
    String? errorMessage,
  }) {
    return SauvegardeSiteIdWixState(
      status: status ?? this.status,
      siteId: siteId ?? this.siteId,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        siteId,
        isValid,
        errorMessage,
      ];
}
