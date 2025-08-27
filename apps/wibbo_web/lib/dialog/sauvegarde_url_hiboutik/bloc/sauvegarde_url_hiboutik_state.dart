part of 'sauvegarde_url_hiboutik_bloc.dart';

enum SauvegardeUrlHiboutikStatus {
  initial,
  loading,
  success,
  failure,
}

class SauvegardeUrlHiboutikState extends Equatable {
  const SauvegardeUrlHiboutikState({
    this.status = SauvegardeUrlHiboutikStatus.initial,
    this.url = const TextInput.pure(),
    this.isValid = false,
    this.errorMessage,
  });

  factory SauvegardeUrlHiboutikState.initial(String currentUrl) {
    return SauvegardeUrlHiboutikState(
      url: TextInput.dirty(currentUrl),
      isValid: TextInput.dirty(currentUrl).isValid,
    );
  }

  final SauvegardeUrlHiboutikStatus status;
  final TextInput url;
  final bool isValid;
  final String? errorMessage;

  bool get isLoading => status == SauvegardeUrlHiboutikStatus.loading;
  bool get isSuccess => status == SauvegardeUrlHiboutikStatus.success;
  bool get isFailure => status == SauvegardeUrlHiboutikStatus.failure;

  SauvegardeUrlHiboutikState copyWith({
    SauvegardeUrlHiboutikStatus? status,
    TextInput? url,
    bool? isValid,
    String? errorMessage,
  }) {
    return SauvegardeUrlHiboutikState(
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
