part of 'sauvegarde_api_key_wix_bloc.dart';

enum SauvegardeApiKeyWixStatus {
  initial,
  loading,
  success,
  failure,
}

class SauvegardeApiKeyWixState extends Equatable {
  const SauvegardeApiKeyWixState({
    this.status = SauvegardeApiKeyWixStatus.initial,
    this.apiKey = const TextInput.pure(),
    this.isValid = false,
    this.errorMessage,
  });

  factory SauvegardeApiKeyWixState.initial(String currentApiKey) {
    return SauvegardeApiKeyWixState(
      apiKey: TextInput.dirty(currentApiKey),
      isValid: TextInput.dirty(currentApiKey).isValid,
    );
  }

  final SauvegardeApiKeyWixStatus status;
  final TextInput apiKey;
  final bool isValid;
  final String? errorMessage;

  bool get isLoading => status == SauvegardeApiKeyWixStatus.loading;
  bool get isSuccess => status == SauvegardeApiKeyWixStatus.success;
  bool get isFailure => status == SauvegardeApiKeyWixStatus.failure;

  SauvegardeApiKeyWixState copyWith({
    SauvegardeApiKeyWixStatus? status,
    TextInput? apiKey,
    bool? isValid,
    String? errorMessage,
  }) {
    return SauvegardeApiKeyWixState(
      status: status ?? this.status,
      apiKey: apiKey ?? this.apiKey,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        apiKey,
        isValid,
        errorMessage,
      ];
}
