// ignore_for_file: public_member_api_docs, avoid_returning_this,

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:core/src/models/firestore_serializable.dart';
import 'package:equatable/equatable.dart';

part 'compte_utilisateur.g.dart';

@firestoreSerializable
class CompteUtilisateur extends Equatable {
  const CompteUtilisateur({
    required this.idCompte,
    required this.email,
    required this.dateCreation,
    this.dateValiditer,
    this.hiboutikEmail = '',
    this.hiboutikMotDePasse = '',
    this.urlHiboutik = '',
    this.hiboutikIdVendeur = '',
    this.hiboutikWebHook = '',
    this.urlWix = '',
    this.wixSiteId = '',
    this.wixApiKey = '',
    this.wixWebHook = '',
    this.hiboutikWebHookCreationArticle = '',
  });

  factory CompteUtilisateur.fromJson(Map<String, dynamic> json) =>
      _$CompteUtilisateurFromJson(json);

  Map<String, dynamic> toJson() => _$CompteUtilisateurToJson(this);

  CompteUtilisateur copyWith({
    String? idCompte,
    String? email,
    DateTime? dateCreation,
    DateTime? dateValiditer,
    String? hiboutikEmail,
    String? hiboutikMotDePasse,
    String? urlHiboutik,
    String? hiboutikIdVendeur,
    String? hiboutikWebHook,
    String? urlWix,
    String? wixSiteId,
    String? wixApiKey,
    String? wixWebHook,
    String? hiboutikWebHookCreationArticle,
  }) => CompteUtilisateur(
    idCompte: idCompte ?? this.idCompte,
    email: email ?? this.email,
    dateCreation: dateCreation ?? this.dateCreation,
    dateValiditer: dateValiditer ?? this.dateValiditer,
    hiboutikEmail: hiboutikEmail ?? this.hiboutikEmail,
    hiboutikMotDePasse: hiboutikMotDePasse ?? this.hiboutikMotDePasse,
    urlHiboutik: urlHiboutik ?? this.urlHiboutik,
    hiboutikIdVendeur: hiboutikIdVendeur ?? this.hiboutikIdVendeur,
    hiboutikWebHook: hiboutikWebHook ?? this.hiboutikWebHook,
    urlWix: urlWix ?? this.urlWix,
    wixSiteId: wixSiteId ?? this.wixSiteId,
    wixApiKey: wixApiKey ?? this.wixApiKey,
    wixWebHook: wixWebHook ?? this.wixWebHook,
    hiboutikWebHookCreationArticle:
        hiboutikWebHookCreationArticle ?? this.hiboutikWebHookCreationArticle,
  );

  //firestore
  @Id()
  final String idCompte;
  final String email;
  final DateTime dateCreation;
  final DateTime? dateValiditer;
  //hiboutik
  final String hiboutikEmail;
  final String hiboutikMotDePasse;
  final String urlHiboutik;
  final String hiboutikIdVendeur;
  final String hiboutikWebHook;
  final String hiboutikWebHookCreationArticle;
  //wix
  final String urlWix;
  final String wixSiteId;
  final String wixApiKey;
  final String wixWebHook;

  @override
  List<Object?> get props => [
    idCompte,
    email,
    dateCreation,
    dateValiditer,
    hiboutikEmail,
    hiboutikMotDePasse,
    urlHiboutik,
    hiboutikIdVendeur,
    hiboutikWebHook,
    hiboutikWebHookCreationArticle,
    urlWix,
    wixSiteId,
    wixApiKey,
    wixWebHook,
  ];
}

@Collection<CompteUtilisateur>('compte_utilisateurs')
final compteUtilisateurRef = CompteUtilisateurCollectionReference();

class CompteUtilisateurBuilder {
  String? idCompte;
  DateTime? dateCreation;
  DateTime? dateValiditer;
  String? hiboutikEmail;
  String? hiboutikMotDePasse;
  String? urlHiboutik;
  String? hiboutikIdVendeur;
  String? hiboutikWebHook;
  String? hiboutikWebHookCreationArticle;
  String? email;
  String? urlWix;
  String? wixSiteId;
  String? wixApiKey;
  String? wixWebHook;

  CompteUtilisateur build() {
    return CompteUtilisateur(
      idCompte: idCompte ?? '',
      dateCreation: dateCreation ?? DateTime.now(),
      dateValiditer: dateValiditer,
      hiboutikEmail: hiboutikEmail ?? '',
      hiboutikMotDePasse: hiboutikMotDePasse ?? '',
      urlHiboutik: urlHiboutik ?? '',
      hiboutikIdVendeur: hiboutikIdVendeur ?? '',
      hiboutikWebHook: hiboutikWebHook ?? '',
      hiboutikWebHookCreationArticle: hiboutikWebHookCreationArticle ?? '',
      urlWix: urlWix ?? '',
      wixSiteId: wixSiteId ?? '',
      wixApiKey: wixApiKey ?? '',
      wixWebHook: wixWebHook ?? '',
      email: email ?? '',
    );
  }

  CompteUtilisateurBuilder withIdCompte(String idCompte) {
    this.idCompte = idCompte;
    return this;
  }

  CompteUtilisateurBuilder withDateCreation(DateTime dateCreation) {
    this.dateCreation = dateCreation;
    return this;
  }

  CompteUtilisateurBuilder withDateValiditer(DateTime dateValiditer) {
    this.dateValiditer = dateValiditer;
    return this;
  }

  CompteUtilisateurBuilder withHiboutikEmail(String hiboutikEmail) {
    this.hiboutikEmail = hiboutikEmail;
    return this;
  }

  CompteUtilisateurBuilder withHiboutikMotDePasse(String hiboutikMotDePasse) {
    this.hiboutikMotDePasse = hiboutikMotDePasse;
    return this;
  }

  CompteUtilisateurBuilder withUrlHiboutik(String urlHiboutik) {
    this.urlHiboutik = urlHiboutik;
    return this;
  }

  CompteUtilisateurBuilder withHiboutikIdVendeur(String hiboutikIdVendeur) {
    this.hiboutikIdVendeur = hiboutikIdVendeur;
    return this;
  }

  CompteUtilisateurBuilder withHiboutikWebHook(String hiboutikWebHook) {
    this.hiboutikWebHook = hiboutikWebHook;
    return this;
  }

  CompteUtilisateurBuilder withUrlWix(String urlWix) {
    this.urlWix = urlWix;
    return this;
  }

  CompteUtilisateurBuilder withWixSiteId(String wixSiteId) {
    this.wixSiteId = wixSiteId;
    return this;
  }

  CompteUtilisateurBuilder withWixApiKey(String wixApiKey) {
    this.wixApiKey = wixApiKey;
    return this;
  }

  CompteUtilisateurBuilder withWixWebHook(String wixWebHook) {
    this.wixWebHook = wixWebHook;
    return this;
  }

  CompteUtilisateurBuilder withEmail(String email) {
    this.email = email;
    return this;
  }

  CompteUtilisateurBuilder withHiboutikWebHookCreationArticle(
    String hiboutikWebHookCreationArticle,
  ) {
    this.hiboutikWebHookCreationArticle = hiboutikWebHookCreationArticle;
    return this;
  }
}
