part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

final class AppStreamUser extends AppEvent {
  const AppStreamUser();
}

final class AppAuthenticationNavigationChanged extends AppEvent {
  const AppAuthenticationNavigationChanged();
}

final class AppUserChanged extends AppEvent {
  const AppUserChanged(this.user);

  final User user;
}

final class AppDeconnexion extends AppEvent {
  const AppDeconnexion({
    this.erreur,
  });

  final Exception? erreur;

  @override
  List<Object?> get props => [erreur];
}
