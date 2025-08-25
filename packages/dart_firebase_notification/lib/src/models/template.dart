class Template {
  const Template({
    required this.titre,
    required this.contenu,
    required this.uid,
    this.urlImage,
  });

  factory Template.fromJson(Map<String, dynamic> json) {
    return Template(
      titre: json['titre'] as String,
      contenu: json['contenu'] as String,
      uid: json['uid'] as String,
      urlImage: json['urlImage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'titre': titre,
      'contenu': contenu,
      'uid': uid,
      'urlImage': urlImage,
    };
  }

  final String uid;
  final String titre;
  final String contenu;
  final String? urlImage;

  Template copyWith({
    String? titre,
    String? contenu,
    String? uid,
    String? urlImage,
  }) {
    return Template(
      titre: titre ?? this.titre,
      contenu: contenu ?? this.contenu,
      uid: uid ?? this.uid,
      urlImage: urlImage ?? this.urlImage,
    );
  }
}
