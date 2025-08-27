part of 'sauvegarde_url_wix_bloc.dart';

sealed class SauvegardeUrlWixEvent extends Equatable {
  const SauvegardeUrlWixEvent();

  @override
  List<Object?> get props => [];
}

final class SauvegardeUrlWixUrlChanged extends SauvegardeUrlWixEvent {
  const SauvegardeUrlWixUrlChanged(this.url);

  final String url;

  @override
  List<Object?> get props => [url];
}

final class SauvegardeUrlWixSubmitted extends SauvegardeUrlWixEvent {
  const SauvegardeUrlWixSubmitted();
}
