part of 'connexion_bloc.dart';

sealed class ConnexionEvent extends Equatable {
  const ConnexionEvent();
  @override
  List<Object> get props => [];
}

final class ConnexionEmailChanged extends ConnexionEvent {
  const ConnexionEmailChanged(this.email);
  final String email;
}

final class ConnexionMotDePasseChanged extends ConnexionEvent {
  const ConnexionMotDePasseChanged(this.motDePasse);
  final String motDePasse;
}

final class ConnexionShowMotDePasseChanged extends ConnexionEvent {
  const ConnexionShowMotDePasseChanged();
}

final class ConnexionSubmitted extends ConnexionEvent {
  const ConnexionSubmitted();
}

final class ConnexionInscription extends ConnexionEvent {
  const ConnexionInscription();
}
