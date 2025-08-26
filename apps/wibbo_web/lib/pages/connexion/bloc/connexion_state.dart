part of 'connexion_bloc.dart';

class ConnexionState extends Equatable {
  const ConnexionState({
    this.email = const EmailInput.pure(),
    this.motDePasse = const MotDePasseInput.pure(),
    this.motDePasseVisible = false,
    this.status = FormzSubmissionStatus.initial,
    this.exception,
  });

  final EmailInput email;
  final MotDePasseInput motDePasse;
  final bool motDePasseVisible;
  final FormzSubmissionStatus status;

  final Exception? exception;

  ConnexionState copyWith({
    EmailInput? email,
    MotDePasseInput? motDePasse,
    bool? motDePasseVisible,
    FormzSubmissionStatus? status,
    Exception? exception,
  }) {
    return ConnexionState(
      email: email ?? this.email,
      motDePasse: motDePasse ?? this.motDePasse,
      motDePasseVisible: motDePasseVisible ?? this.motDePasseVisible,
      status: status ?? this.status,
      exception: exception,
    );
  }

  @override
  List<Object?> get props => [
    email,
    motDePasse,
    motDePasseVisible,
    status,
    exception,
  ];
}
