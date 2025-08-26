part of 'inscription_bloc.dart';

class InscriptionState extends Equatable {
  const InscriptionState({
    this.email = const EmailInput.pure(),
    this.motDePasse = const MotDePasseInput.pure(),
    this.confirmationMotDePasse = const MotDePasseInput.pure(),
    this.motDePasseVisible = false,
    this.confirmationMotDePasseVisible = false,
    // Nouveaux champs pour Hiboutik
    this.hiboutikEmail = const EmailInput.pure(),
    this.hiboutikIdVendeur = const TextInput.pure(),
    this.hiboutikMotDePasse = const MotDePasseInput.pure(),
    this.hiboutikMotDePasseVisible = false,
    this.urlHiboutik = const TextInput.pure(),
    // Nouveaux champs pour Wix
    this.urlWix = const TextInput.pure(),
    this.wixApiKey = const TextInput.pure(),
    this.wixSiteId = const TextInput.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.exception,
  });

  final EmailInput email;
  final MotDePasseInput motDePasse;
  final MotDePasseInput confirmationMotDePasse;
  final bool motDePasseVisible;
  final bool confirmationMotDePasseVisible;
  // Nouveaux champs pour Hiboutik
  final EmailInput hiboutikEmail;
  final TextInput hiboutikIdVendeur;
  final MotDePasseInput hiboutikMotDePasse;
  final bool hiboutikMotDePasseVisible;
  final TextInput urlHiboutik;
  // Nouveaux champs pour Wix
  final TextInput urlWix;
  final TextInput wixApiKey;
  final TextInput wixSiteId;
  final FormzSubmissionStatus status;
  final Exception? exception;

  InscriptionState copyWith({
    EmailInput? email,
    MotDePasseInput? motDePasse,
    MotDePasseInput? confirmationMotDePasse,
    bool? motDePasseVisible,
    bool? confirmationMotDePasseVisible,
    // Nouveaux champs pour Hiboutik
    EmailInput? hiboutikEmail,
    TextInput? hiboutikIdVendeur,
    MotDePasseInput? hiboutikMotDePasse,
    bool? hiboutikMotDePasseVisible,
    TextInput? urlHiboutik,
    // Nouveaux champs pour Wix
    TextInput? urlWix,
    TextInput? wixApiKey,
    TextInput? wixSiteId,
    FormzSubmissionStatus? status,
    Exception? exception,
  }) {
    return InscriptionState(
      email: email ?? this.email,
      motDePasse: motDePasse ?? this.motDePasse,
      confirmationMotDePasse:
          confirmationMotDePasse ?? this.confirmationMotDePasse,
      motDePasseVisible: motDePasseVisible ?? this.motDePasseVisible,
      confirmationMotDePasseVisible:
          confirmationMotDePasseVisible ?? this.confirmationMotDePasseVisible,
      // Nouveaux champs pour Hiboutik
      hiboutikEmail: hiboutikEmail ?? this.hiboutikEmail,
      hiboutikIdVendeur: hiboutikIdVendeur ?? this.hiboutikIdVendeur,
      hiboutikMotDePasse: hiboutikMotDePasse ?? this.hiboutikMotDePasse,
      hiboutikMotDePasseVisible: hiboutikMotDePasseVisible ?? this.hiboutikMotDePasseVisible,
      urlHiboutik: urlHiboutik ?? this.urlHiboutik,
      // Nouveaux champs pour Wix
      urlWix: urlWix ?? this.urlWix,
      wixApiKey: wixApiKey ?? this.wixApiKey,
      wixSiteId: wixSiteId ?? this.wixSiteId,
      status: status ?? this.status,
      exception: exception,
    );
  }

  @override
  List<Object?> get props => [
    email,
    motDePasse,
    confirmationMotDePasse,
    motDePasseVisible,
    confirmationMotDePasseVisible,
    // Nouveaux champs pour Hiboutik
    hiboutikEmail,
    hiboutikIdVendeur,
    hiboutikMotDePasse,
    hiboutikMotDePasseVisible,
    urlHiboutik,
    // Nouveaux champs pour Wix
    urlWix,
    wixApiKey,
    wixSiteId,
    status,
    exception,
  ];
}
