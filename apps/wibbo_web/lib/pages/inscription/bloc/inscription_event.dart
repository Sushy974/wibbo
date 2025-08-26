part of 'inscription_bloc.dart';

sealed class InscriptionEvent extends Equatable {
  const InscriptionEvent();
  @override
  List<Object> get props => [];
}

final class InscriptionEmailChanged extends InscriptionEvent {
  const InscriptionEmailChanged(this.email);
  final String email;
}

final class InscriptionMotDePasseChanged extends InscriptionEvent {
  const InscriptionMotDePasseChanged(this.motDePasse);
  final String motDePasse;
}

final class InscriptionConfirmationMotDePasseChanged extends InscriptionEvent {
  const InscriptionConfirmationMotDePasseChanged(this.confirmationMotDePasse);
  final String confirmationMotDePasse;
}

final class InscriptionShowMotDePasseChanged extends InscriptionEvent {
  const InscriptionShowMotDePasseChanged();
}

final class InscriptionShowConfirmationMotDePasseChanged
    extends InscriptionEvent {
  const InscriptionShowConfirmationMotDePasseChanged();
}

final class InscriptionSubmitted extends InscriptionEvent {
  const InscriptionSubmitted();
}
