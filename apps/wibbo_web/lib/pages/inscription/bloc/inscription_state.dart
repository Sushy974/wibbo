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
    this.hiboutikApiKey = const TextInput.pure(),
    this.hiboutikMotDePasseVisible = false,
    this.urlHiboutik = const TextInput.pure(),
    // Nouveaux champs pour Wix
    this.urlWix = const TextInput.pure(),
    this.wixApiKey = const TextInput.pure(),
    this.wixSiteId = const TextInput.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.exception,
    this.isEmailDisponnible = const BoolValide.pure(),
  });

  final EmailInput email;
  final MotDePasseInput motDePasse;
  final MotDePasseInput confirmationMotDePasse;
  final bool motDePasseVisible;
  final bool confirmationMotDePasseVisible;
  // Nouveaux champs pour Hiboutik
  final EmailInput hiboutikEmail;
  final TextInput hiboutikIdVendeur;
  final TextInput hiboutikApiKey;
  final bool hiboutikMotDePasseVisible;
  final TextInput urlHiboutik;
  // Nouveaux champs pour Wix
  final TextInput urlWix;
  final TextInput wixApiKey;
  final TextInput wixSiteId;
  final FormzSubmissionStatus status;
  final Exception? exception;

  final BoolValide isEmailDisponnible;

  InscriptionState copyWith({
    EmailInput? email,
    MotDePasseInput? motDePasse,
    MotDePasseInput? confirmationMotDePasse,
    bool? motDePasseVisible,
    bool? confirmationMotDePasseVisible,
    // Nouveaux champs pour Hiboutik
    EmailInput? hiboutikEmail,
    TextInput? hiboutikIdVendeur,
    TextInput? hiboutikApiKey,
    bool? hiboutikMotDePasseVisible,
    TextInput? urlHiboutik,
    // Nouveaux champs pour Wix
    TextInput? urlWix,
    TextInput? wixApiKey,
    TextInput? wixSiteId,
    FormzSubmissionStatus? status,
    Exception? exception,
    BoolValide? isEmailDisponnible,
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
      hiboutikApiKey: hiboutikApiKey ?? this.hiboutikApiKey,
      hiboutikMotDePasseVisible:
          hiboutikMotDePasseVisible ?? this.hiboutikMotDePasseVisible,
      urlHiboutik: urlHiboutik ?? this.urlHiboutik,
      // Nouveaux champs pour Wix
      urlWix: urlWix ?? this.urlWix,
      wixApiKey: wixApiKey ?? this.wixApiKey,
      wixSiteId: wixSiteId ?? this.wixSiteId,
      status: status ?? this.status,
      exception: exception,
      isEmailDisponnible: isEmailDisponnible ?? this.isEmailDisponnible,
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
    hiboutikApiKey,
    hiboutikMotDePasseVisible,
    urlHiboutik,
    // Nouveaux champs pour Wix
    urlWix,
    wixApiKey,
    wixSiteId,
    status,
    exception,
    isEmailDisponnible,
  ];
}
