part of 'sauvegarde_api_key_hiboutik_bloc.dart';

enum SauvegardeApiKeyHiboutikStatus { initial, loading, success, failure }

class SauvegardeApiKeyHiboutikState extends Equatable {
  const SauvegardeApiKeyHiboutikState({
    this.status = SauvegardeApiKeyHiboutikStatus.initial,
    this.apiKey = const TextInput.pure(),
    this.uid = '',
    this.isValid = false,
  });

  final SauvegardeApiKeyHiboutikStatus status;
  final TextInput apiKey;
  final String uid;
  final bool isValid;

  bool get isLoading => status == SauvegardeApiKeyHiboutikStatus.loading;

  SauvegardeApiKeyHiboutikState copyWith({
    SauvegardeApiKeyHiboutikStatus? status,
    TextInput? apiKey,
    String? uid,
    bool? isValid,
  }) {
    return SauvegardeApiKeyHiboutikState(
      status: status ?? this.status,
      apiKey: apiKey ?? this.apiKey,
      uid: uid ?? this.uid,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, apiKey, uid, isValid];
}
