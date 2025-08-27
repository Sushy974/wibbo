part of 'sauvegarde_id_vendeur_hiboutik_bloc.dart';

sealed class SauvegardeIdVendeurHiboutikEvent extends Equatable {
  const SauvegardeIdVendeurHiboutikEvent();

  @override
  List<Object?> get props => [];
}

final class SauvegardeIdVendeurHiboutikIdChanged extends SauvegardeIdVendeurHiboutikEvent {
  const SauvegardeIdVendeurHiboutikIdChanged(this.idVendeur);

  final String idVendeur;

  @override
  List<Object?> get props => [idVendeur];
}

final class SauvegardeIdVendeurHiboutikSubmitted extends SauvegardeIdVendeurHiboutikEvent {
  const SauvegardeIdVendeurHiboutikSubmitted();
}
