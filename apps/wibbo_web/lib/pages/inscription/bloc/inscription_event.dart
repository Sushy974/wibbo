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

// Nouveaux événements pour Hiboutik
final class InscriptionHiboutikEmailChanged extends InscriptionEvent {
  const InscriptionHiboutikEmailChanged(this.hiboutikEmail);
  final String hiboutikEmail;
}

final class InscriptionHiboutikIdVendeurChanged extends InscriptionEvent {
  const InscriptionHiboutikIdVendeurChanged(this.hiboutikIdVendeur);
  final String hiboutikIdVendeur;
}

final class InscriptionHiboutikMotDePasseChanged extends InscriptionEvent {
  const InscriptionHiboutikMotDePasseChanged(this.hiboutikMotDePasse);
  final String hiboutikMotDePasse;
}

final class InscriptionShowHiboutikMotDePasseChanged extends InscriptionEvent {
  const InscriptionShowHiboutikMotDePasseChanged();
}

final class InscriptionUrlHiboutikChanged extends InscriptionEvent {
  const InscriptionUrlHiboutikChanged(this.urlHiboutik);
  final String urlHiboutik;
}

// Nouveaux événements pour Wix
final class InscriptionUrlWixChanged extends InscriptionEvent {
  const InscriptionUrlWixChanged(this.urlWix);
  final String urlWix;
}

final class InscriptionWixApiKeyChanged extends InscriptionEvent {
  const InscriptionWixApiKeyChanged(this.wixApiKey);
  final String wixApiKey;
}

final class InscriptionWixSiteIdChanged extends InscriptionEvent {
  const InscriptionWixSiteIdChanged(this.wixSiteId);
  final String wixSiteId;
}

final class InscriptionSubmitted extends InscriptionEvent {
  const InscriptionSubmitted();
}

final class InscriptionVerifieEmailDisponnible extends InscriptionEvent {
  const InscriptionVerifieEmailDisponnible();
}
