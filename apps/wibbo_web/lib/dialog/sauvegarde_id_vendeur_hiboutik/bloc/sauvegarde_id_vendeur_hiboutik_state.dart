part of 'sauvegarde_id_vendeur_hiboutik_bloc.dart';

enum SauvegardeIdVendeurHiboutikStatus {
  initial,
  loading,
  success,
  failure,
}

class SauvegardeIdVendeurHiboutikState extends Equatable {
  const SauvegardeIdVendeurHiboutikState({
    this.status = SauvegardeIdVendeurHiboutikStatus.initial,
    this.idVendeur = const TextInput.pure(),
    this.isValid = false,
    this.errorMessage,
  });

  factory SauvegardeIdVendeurHiboutikState.initial(String currentIdVendeur) {
    return SauvegardeIdVendeurHiboutikState(
      idVendeur: TextInput.dirty(currentIdVendeur),
      isValid: TextInput.dirty(currentIdVendeur).isValid,
    );
  }

  final SauvegardeIdVendeurHiboutikStatus status;
  final TextInput idVendeur;
  final bool isValid;
  final String? errorMessage;

  bool get isLoading => status == SauvegardeIdVendeurHiboutikStatus.loading;
  bool get isSuccess => status == SauvegardeIdVendeurHiboutikStatus.success;
  bool get isFailure => status == SauvegardeIdVendeurHiboutikStatus.failure;

  SauvegardeIdVendeurHiboutikState copyWith({
    SauvegardeIdVendeurHiboutikStatus? status,
    TextInput? idVendeur,
    bool? isValid,
    String? errorMessage,
  }) {
    return SauvegardeIdVendeurHiboutikState(
      status: status ?? this.status,
      idVendeur: idVendeur ?? this.idVendeur,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        idVendeur,
        isValid,
        errorMessage,
      ];
}
