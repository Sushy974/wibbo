part of 'sauvegarde_url_hiboutik_bloc.dart';

sealed class SauvegardeUrlHiboutikEvent extends Equatable {
  const SauvegardeUrlHiboutikEvent();

  @override
  List<Object?> get props => [];
}

final class SauvegardeUrlHiboutikUrlChanged extends SauvegardeUrlHiboutikEvent {
  const SauvegardeUrlHiboutikUrlChanged(this.url);

  final String url;

  @override
  List<Object?> get props => [url];
}

final class SauvegardeUrlHiboutikSubmitted extends SauvegardeUrlHiboutikEvent {
  const SauvegardeUrlHiboutikSubmitted();
}
