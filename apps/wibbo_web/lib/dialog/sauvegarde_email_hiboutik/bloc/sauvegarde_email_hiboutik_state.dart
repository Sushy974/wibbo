part of 'sauvegarde_email_hiboutik_bloc.dart';

enum SauvegardeEmailHiboutikStatus {
  initial,
  loading,
  success,
  failure,
}

class SauvegardeEmailHiboutikState extends Equatable {
  const SauvegardeEmailHiboutikState({
    this.status = SauvegardeEmailHiboutikStatus.initial,
    this.email = const EmailInput.pure(),
    this.isValid = false,
    this.errorMessage,
  });

  factory SauvegardeEmailHiboutikState.initial(String currentEmail) {
    return SauvegardeEmailHiboutikState(
      email: EmailInput.dirty(currentEmail),
      isValid: EmailInput.dirty(currentEmail).isValid,
    );
  }

  final SauvegardeEmailHiboutikStatus status;
  final EmailInput email;
  final bool isValid;
  final String? errorMessage;

  bool get isLoading => status == SauvegardeEmailHiboutikStatus.loading;
  bool get isSuccess => status == SauvegardeEmailHiboutikStatus.success;
  bool get isFailure => status == SauvegardeEmailHiboutikStatus.failure;

  SauvegardeEmailHiboutikState copyWith({
    SauvegardeEmailHiboutikStatus? status,
    EmailInput? email,
    bool? isValid,
    String? errorMessage,
  }) {
    return SauvegardeEmailHiboutikState(
      status: status ?? this.status,
      email: email ?? this.email,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        email,
        isValid,
        errorMessage,
      ];
}
