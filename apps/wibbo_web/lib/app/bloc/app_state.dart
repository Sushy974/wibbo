part of 'app_bloc.dart';

enum AuthenticationNavigation {
  pageConnexion,
  pageInscription,
  pageBienvenue,
}

extension AuthenticationNavigationX on AuthenticationNavigation {
  bool get isPageConnexion => this == AuthenticationNavigation.pageConnexion;

  bool get isPageInscription =>
      this == AuthenticationNavigation.pageInscription;

  bool get isPageBienvenue => this == AuthenticationNavigation.pageBienvenue;

  static AuthenticationNavigation fromJson(String value) {
    switch (value) {
      case 'pageConnexion':
        return AuthenticationNavigation.pageConnexion;
      case 'pageInscription':
        return AuthenticationNavigation.pageInscription;
      case 'pageBienvenue':
        return AuthenticationNavigation.pageBienvenue;
      default:
        return AuthenticationNavigation.pageBienvenue;
    }
  }

  Map<String, dynamic> toJson() {
    switch (this) {
      case AuthenticationNavigation.pageConnexion:
        return {'authenticationNavigation': 'pageConnexion'};
      case AuthenticationNavigation.pageInscription:
        return {'authenticationNavigation': 'pageInscription'};
      case AuthenticationNavigation.pageBienvenue:
        return {'authenticationNavigation': 'pageBienvenue'};
    }
  }
}

class AppState extends Equatable {
  const AppState({
    this.user = User.empty,
    this.authenticationNavigation = AuthenticationNavigation.pageConnexion,
    this.demandeRenouvellementAbonnement = false,
  });

  final AuthenticationNavigation authenticationNavigation;
  final User user;
  final bool demandeRenouvellementAbonnement;

  bool get nestPasConnecte => user.id.isEmpty;
  bool get estAnonyme => user.isAnonymous ?? false;

  AppState copyWith({
    User? user,
    AuthenticationNavigation? authenticationNavigation,
    bool? enInscription,
    bool? demandeRenouvellementAbonnement,
    String? version,
  }) {
    return AppState(
      user: user ?? this.user,
      authenticationNavigation:
          authenticationNavigation ?? this.authenticationNavigation,
      demandeRenouvellementAbonnement:
          demandeRenouvellementAbonnement ??
          this.demandeRenouvellementAbonnement,
    );
  }

  @override
  List<Object?> get props => [
    user,
    authenticationNavigation,
    demandeRenouvellementAbonnement,
  ];
}
