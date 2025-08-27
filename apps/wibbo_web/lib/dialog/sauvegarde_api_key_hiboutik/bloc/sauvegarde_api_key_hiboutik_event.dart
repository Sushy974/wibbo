part of 'sauvegarde_api_key_hiboutik_bloc.dart';

abstract class SauvegardeApiKeyHiboutikEvent extends Equatable {
  const SauvegardeApiKeyHiboutikEvent();

  @override
  List<Object> get props => [];
}

class SauvegardeApiKeyHiboutikApiKeyChanged extends SauvegardeApiKeyHiboutikEvent {
  const SauvegardeApiKeyHiboutikApiKeyChanged(this.apiKey);

  final String apiKey;

  @override
  List<Object> get props => [apiKey];
}

class SauvegardeApiKeyHiboutikSubmitted extends SauvegardeApiKeyHiboutikEvent {
  const SauvegardeApiKeyHiboutikSubmitted();
}
