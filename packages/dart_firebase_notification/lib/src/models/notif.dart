import 'package:dart_firebase_notification/src/models/notif_template.dart';
import 'package:dart_firebase_notification/src/models/statut_envoi.dart';

class Notif {
  const Notif({
    required this.envoyerPour,
    required this.notifTemplate,
    this.statutEnvoi,
    this.uid,
    this.data = const {},
    this.urlImage,
  });

  factory Notif.fromJson(Map<String, dynamic> json) {
    final statut = json['statutEnvoi'] as Map<String, dynamic>?;
    final data = (json['data'] as Map<String, Object?>?)?.map(
      (key, value) => MapEntry(key, value.toString()),
    );

    try {
      final notif = Notif(
        statutEnvoi: statut == null ? null : StatutEnvoi.fromJson(statut),
        envoyerPour: (json['envoyerPour'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        notifTemplate: NotifTemplate.fromJson(
          json['notifTemplate'] as Map<String, dynamic>,
        ),
        uid: json['uid'] as String?,
        data: data ?? {},
        urlImage: json['urlImage'] as String?,
      );
      return notif;
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'statut': statutEnvoi?.toJson(),
      'envoyerPour': envoyerPour,
      'notifTemplate': notifTemplate.toJson(),
      'uid': uid,
      'data': data,
      'urlImage': urlImage,
    };
  }

  final String? uid;
  final StatutEnvoi? statutEnvoi;
  final List<String> envoyerPour;
  final NotifTemplate notifTemplate;
  final Map<String, String> data;
  final String? urlImage;

  Notif copyWith({
    StatutEnvoi? statutEnvoi,
    List<String>? envoyerPour,
    NotifTemplate? notifTemplate,
    String? uid,
    String? urlImage,
    Map<String, String>? data,
  }) {
    return Notif(
      statutEnvoi: statutEnvoi ?? this.statutEnvoi,
      envoyerPour: envoyerPour ?? this.envoyerPour,
      notifTemplate: notifTemplate ?? this.notifTemplate,
      uid: uid ?? this.uid,
      urlImage: urlImage ?? this.urlImage,
      data: data ?? this.data,
    );
  }
}
