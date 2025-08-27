part of 'sauvegarde_api_key_wix_bloc.dart';

sealed class SauvegardeApiKeyWixEvent extends Equatable {
  const SauvegardeApiKeyWixEvent();

  @override
  List<Object?> get props => [];
}

final class SauvegardeApiKeyWixApiKeyChanged extends SauvegardeApiKeyWixEvent {
  const SauvegardeApiKeyWixApiKeyChanged(this.apiKey);

  final String apiKey;

  @override
  List<Object?> get props => [apiKey];
}

final class SauvegardeApiKeyWixSubmitted extends SauvegardeApiKeyWixEvent {
  const SauvegardeApiKeyWixSubmitted();
}
