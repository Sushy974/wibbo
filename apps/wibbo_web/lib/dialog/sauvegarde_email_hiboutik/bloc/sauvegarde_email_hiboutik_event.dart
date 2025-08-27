part of 'sauvegarde_email_hiboutik_bloc.dart';

sealed class SauvegardeEmailHiboutikEvent extends Equatable {
  const SauvegardeEmailHiboutikEvent();

  @override
  List<Object?> get props => [];
}

final class SauvegardeEmailHiboutikEmailChanged extends SauvegardeEmailHiboutikEvent {
  const SauvegardeEmailHiboutikEmailChanged(this.email);

  final String email;

  @override
  List<Object?> get props => [email];
}

final class SauvegardeEmailHiboutikSubmitted extends SauvegardeEmailHiboutikEvent {
  const SauvegardeEmailHiboutikSubmitted();
}
