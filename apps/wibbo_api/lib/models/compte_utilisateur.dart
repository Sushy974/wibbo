// ignore_for_file: public_member_api_docs, avoid_returning_this

import 'package:equatable/equatable.dart';
import 'package:dart_firebase_admin/firestore.dart';
import '../extensions.dart';

class CompteUtilisateur extends Equatable {
  const CompteUtilisateur({
    required this.idCompte,
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
  });

  factory CompteUtilisateur.fromJson(Map<String, dynamic> json) {
    return CompteUtilisateur(
      idCompte: json['idCompte'] as String,
      dateCreation: (json['dateCreation'] as Timestamp).toDate(),
      dateValiditer: json['dateValiditer'] != null
          ? (json['dateValiditer'] as Timestamp).toDate()
          : null,
      hiboutikEmail: json['hiboutikEmail'] as String,
      hiboutikMotDePasse: json['hiboutikMotDePasse'] as String,
      urlHiboutik: json['urlHiboutik'] as String,
      hiboutikIdVendeur: json['hiboutikIdVendeur'] as String,
      hiboutikWebHook: json['hiboutikWebHook'] as String,
      urlWix: json['urlWix'] as String,
      wixSiteId: json['wixSiteId'] as String,
      wixApiKey: json['wixApiKey'] as String,
      wixWebHook: json['wixWebHook'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idCompte': idCompte,
      'dateCreation': dateCreation.microsecondsSinceEpoch,
      'dateValiditer': dateValiditer?.microsecondsSinceEpoch,
      'hiboutikEmail': hiboutikEmail,
      'hiboutikMotDePasse': hiboutikMotDePasse,
      'urlHiboutik': urlHiboutik,
      'hiboutikIdVendeur': hiboutikIdVendeur,
      'hiboutikWebHook': hiboutikWebHook,
      'urlWix': urlWix,
      'wixSiteId': wixSiteId,
      'wixApiKey': wixApiKey,
      'wixWebHook': wixWebHook,
    };
  }

  //firestore
  final String idCompte;
  final DateTime dateCreation;
  final DateTime? dateValiditer;
  //hiboutik
  final String hiboutikEmail;
  final String hiboutikMotDePasse;
  final String urlHiboutik;
  final String hiboutikIdVendeur;
  final String hiboutikWebHook;
  //wix
  final String urlWix;
  final String wixSiteId;
  final String wixApiKey;
  final String wixWebHook;

  @override
  List<Object?> get props => [
        idCompte,
        dateCreation,
        dateValiditer,
        hiboutikEmail,
        hiboutikMotDePasse,
        urlHiboutik,
        hiboutikIdVendeur,
        hiboutikWebHook,
        urlWix,
        wixSiteId,
        wixApiKey,
        wixWebHook,
      ];
}

class CompteUtilisateurBuilder {
  String? idCompte;
  DateTime? dateCreation;
  DateTime? dateValiditer;
  String? hiboutikEmail;
  String? hiboutikMotDePasse;
  String? urlHiboutik;
  String? hiboutikIdVendeur;
  String? hiboutikWebHook;

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
      urlWix: urlWix ?? '',
      wixSiteId: wixSiteId ?? '',
      wixApiKey: wixApiKey ?? '',
      wixWebHook: wixWebHook ?? '',
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
}
