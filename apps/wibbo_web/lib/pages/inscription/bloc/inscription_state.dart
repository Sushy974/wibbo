part of 'inscription_bloc.dart';

class InscriptionState extends Equatable {
  const InscriptionState({
    this.email = const EmailInput.pure(),
    this.motDePasse = const MotDePasseInput.pure(),
    this.confirmationMotDePasse = const MotDePasseInput.pure(),
    this.motDePasseVisible = false,
    this.confirmationMotDePasseVisible = false,
    this.status = FormzSubmissionStatus.initial,
    this.exception,
  });

  final EmailInput email;
  final MotDePasseInput motDePasse;
  final MotDePasseInput confirmationMotDePasse;
  final bool motDePasseVisible;
  final bool confirmationMotDePasseVisible;
  final FormzSubmissionStatus status;
  final Exception? exception;

  InscriptionState copyWith({
    EmailInput? email,
    MotDePasseInput? motDePasse,
    MotDePasseInput? confirmationMotDePasse,
    bool? motDePasseVisible,
    bool? confirmationMotDePasseVisible,
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
    status,
    exception,
  ];
}
