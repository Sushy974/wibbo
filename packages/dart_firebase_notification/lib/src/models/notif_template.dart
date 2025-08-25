class NotifTemplate {
  const NotifTemplate({
    required this.nom,
    this.data,
  });

  factory NotifTemplate.fromJson(Map<String, dynamic> json) {
    return NotifTemplate(
      data: json['data'] as Map<String, dynamic>,
      nom: json['nom'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'nom': nom,
    };
  }

  final Map<String, dynamic>? data;
  final String nom;

  NotifTemplate copyWith({
    Map<String, String>? data,
    String? nom,
  }) {
    return NotifTemplate(
      data: data ?? this.data,
      nom: nom ?? this.nom,
    );
  }
}
