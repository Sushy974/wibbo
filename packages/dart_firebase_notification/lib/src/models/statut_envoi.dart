import 'package:dart_firebase_admin/firestore.dart';
import 'package:dart_firebase_notification/src/models/statut_enum.dart';

class StatutEnvoi {
  const StatutEnvoi({
    required this.dateDebutEnvoi,
    this.dateFinEnvoi,
    this.messageErreur,
    this.responses = const [],
    this.statutEnvoiEnum = StatutEnvoiEnum.enCours,
  });

  factory StatutEnvoi.fromJson(Map<String, dynamic> json) {
    final dateDebutTimestamp = json['dateDebutEnvoi'] as Timestamp;
    final dateDebutEnvoi =
        DateTime.fromMillisecondsSinceEpoch(dateDebutTimestamp.seconds * 1000);
    final dateFinEnvoi = json['dateFinEnvoi'] != null
        ? DateTime.fromMillisecondsSinceEpoch(
            (json['dateFinEnvoi'] as Timestamp).seconds * 1000,)
        : null;
    return StatutEnvoi(
      dateDebutEnvoi: dateDebutEnvoi,
      dateFinEnvoi: dateFinEnvoi,
      messageErreur: json['messageErreur'] as String?,
      responses: (json['responses'] as List<dynamic>)
          .map((e) => Info.fromJson(e as Map<String, dynamic>))
          .toList(),
      statutEnvoiEnum: StatutEnvoiEnum.values
          .firstWhere((e) => e.name == json['statut'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dateDebutEnvoi': dateDebutEnvoi.toUtc(),
      'dateFinEnvoi': dateFinEnvoi?.toUtc(),
      'messageErreur': messageErreur,
      'responses': responses.map((e) => e.toJson()).toList(),
      'statut': statutEnvoiEnum.name,
    };
  }

  final DateTime dateDebutEnvoi;
  final DateTime? dateFinEnvoi;
  final String? messageErreur;
  final List<Info> responses;
  final StatutEnvoiEnum statutEnvoiEnum;

  StatutEnvoi copyWith({
    DateTime? dateDebutEnvoi,
    DateTime? dateFinEnvoi,
    String? messageErreur,
    List<Info>? responses,
    StatutEnvoiEnum? statutEnvoiEnum,
  }) {
    return StatutEnvoi(
      dateDebutEnvoi: dateDebutEnvoi ?? this.dateDebutEnvoi,
      dateFinEnvoi: dateFinEnvoi ?? this.dateFinEnvoi,
      messageErreur: messageErreur ?? this.messageErreur,
      responses: responses ?? this.responses,
      statutEnvoiEnum: statutEnvoiEnum ?? this.statutEnvoiEnum,
    );
  }
}

class Info {
  const Info({
    required this.body,
    required this.status,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      body: json['body'] as String,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'body': body,
      'status': status,
    };
  }

  final String body;
  final String status;
}
