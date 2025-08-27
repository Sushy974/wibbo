part of 'profile_bloc.dart';

enum ProfileStatus {
  initial,
  loading,
  success,
  failure,
}

class ProfileState extends Equatable {
  const ProfileState({
    this.status = ProfileStatus.initial,
    this.user = User.empty,
    this.compteUtilisateur,
    this.errorMessage,
  });

  final ProfileStatus status;
  final User user;
  final CompteUtilisateur? compteUtilisateur;
  final String? errorMessage;

  bool get isLoading => status == ProfileStatus.loading;
  bool get isSuccess => status == ProfileStatus.success;
  bool get isFailure => status == ProfileStatus.failure;
  bool get hasUser => user.isNotEmpty;
  bool get hasCompteUtilisateur => compteUtilisateur != null;

  ProfileState copyWith({
    ProfileStatus? status,
    User? user,
    CompteUtilisateur? compteUtilisateur,
    String? errorMessage,
  }) {
    return ProfileState(
      status: status ?? this.status,
      user: user ?? this.user,
      compteUtilisateur: compteUtilisateur ?? this.compteUtilisateur,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        user,
        compteUtilisateur,
        errorMessage,
      ];
}
