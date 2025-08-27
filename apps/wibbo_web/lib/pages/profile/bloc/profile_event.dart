part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

final class ProfileStreamUser extends ProfileEvent {
  const ProfileStreamUser();
}

final class ProfileLoadCompteUtilisateur extends ProfileEvent {
  const ProfileLoadCompteUtilisateur({required this.userId});

  final String userId;

  @override
  List<Object?> get props => [userId];
}
