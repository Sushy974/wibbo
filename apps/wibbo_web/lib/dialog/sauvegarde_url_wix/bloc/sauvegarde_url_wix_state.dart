part of 'sauvegarde_url_wix_bloc.dart';

enum SauvegardeUrlWixStatus {
  initial,
  loading,
  success,
  failure,
}

class SauvegardeUrlWixState extends Equatable {
  const SauvegardeUrlWixState({
    this.status = SauvegardeUrlWixStatus.initial,
    this.url = const TextInput.pure(),
    this.isValid = false,
    this.errorMessage,
  });

  factory SauvegardeUrlWixState.initial(String currentUrl) {
    return SauvegardeUrlWixState(
      url: TextInput.dirty(currentUrl),
      isValid: TextInput.dirty(currentUrl).isValid,
    );
  }

  final SauvegardeUrlWixStatus status;
  final TextInput url;
  final bool isValid;
  final String? errorMessage;

  bool get isLoading => status == SauvegardeUrlWixStatus.loading;
  bool get isSuccess => status == SauvegardeUrlWixStatus.success;
  bool get isFailure => status == SauvegardeUrlWixStatus.failure;

  SauvegardeUrlWixState copyWith({
    SauvegardeUrlWixStatus? status,
    TextInput? url,
    bool? isValid,
    String? errorMessage,
  }) {
    return SauvegardeUrlWixState(
      status: status ?? this.status,
      url: url ?? this.url,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        url,
        isValid,
        errorMessage,
      ];
}
