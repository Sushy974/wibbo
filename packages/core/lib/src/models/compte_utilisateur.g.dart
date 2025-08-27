// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compte_utilisateur.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters, duplicate_ignore
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_internal_member

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class CompteUtilisateurCollectionReference
    implements
        CompteUtilisateurQuery,
        FirestoreCollectionReference<CompteUtilisateur,
            CompteUtilisateurQuerySnapshot> {
  factory CompteUtilisateurCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$CompteUtilisateurCollectionReference;

  static CompteUtilisateur fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return CompteUtilisateur.fromJson(
        {'idCompte': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    CompteUtilisateur value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('idCompte');
  }

  @override
  CollectionReference<CompteUtilisateur> get reference;

  @override
  CompteUtilisateurDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<CompteUtilisateurDocumentReference> add(CompteUtilisateur value);
}

class _$CompteUtilisateurCollectionReference extends _$CompteUtilisateurQuery
    implements CompteUtilisateurCollectionReference {
  factory _$CompteUtilisateurCollectionReference(
      [FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$CompteUtilisateurCollectionReference._(
      firestore.collection('compte_utilisateurs').withConverter(
            fromFirestore: CompteUtilisateurCollectionReference.fromFirestore,
            toFirestore: CompteUtilisateurCollectionReference.toFirestore,
          ),
    );
  }

  _$CompteUtilisateurCollectionReference._(
    CollectionReference<CompteUtilisateur> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<CompteUtilisateur> get reference =>
      super.reference as CollectionReference<CompteUtilisateur>;

  @override
  CompteUtilisateurDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return CompteUtilisateurDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<CompteUtilisateurDocumentReference> add(CompteUtilisateur value) {
    return reference
        .add(value)
        .then((ref) => CompteUtilisateurDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$CompteUtilisateurCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class CompteUtilisateurDocumentReference
    extends FirestoreDocumentReference<CompteUtilisateur,
        CompteUtilisateurDocumentSnapshot> {
  factory CompteUtilisateurDocumentReference(
          DocumentReference<CompteUtilisateur> reference) =
      _$CompteUtilisateurDocumentReference;

  DocumentReference<CompteUtilisateur> get reference;

  /// A reference to the [CompteUtilisateurCollectionReference] containing this document.
  CompteUtilisateurCollectionReference get parent {
    return _$CompteUtilisateurCollectionReference(reference.firestore);
  }

  @override
  Stream<CompteUtilisateurDocumentSnapshot> snapshots();

  @override
  Future<CompteUtilisateurDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Sets data on the document, overwriting any existing data. If the document
  /// does not yet exist, it will be created.
  ///
  /// If [SetOptions] are provided, the data can be merged into an existing
  /// document instead of overwriting.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  Future<void> set(
    CompteUtilisateur model, {
    SetOptions? options,
    FieldValue emailFieldValue,
    FieldValue dateCreationFieldValue,
    FieldValue dateValiditerFieldValue,
    FieldValue hiboutikEmailFieldValue,
    FieldValue hiboutikMotDePasseFieldValue,
    FieldValue urlHiboutikFieldValue,
    FieldValue hiboutikIdVendeurFieldValue,
    FieldValue hiboutikWebHookFieldValue,
    FieldValue hiboutikWebHookCreationArticleFieldValue,
    FieldValue urlWixFieldValue,
    FieldValue wixSiteIdFieldValue,
    FieldValue wixApiKeyFieldValue,
    FieldValue wixWebHookFieldValue,
  });

  /// Writes to the document using the transaction API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void transactionSet(
    Transaction transaction,
    CompteUtilisateur model, {
    SetOptions? options,
    FieldValue emailFieldValue,
    FieldValue dateCreationFieldValue,
    FieldValue dateValiditerFieldValue,
    FieldValue hiboutikEmailFieldValue,
    FieldValue hiboutikMotDePasseFieldValue,
    FieldValue urlHiboutikFieldValue,
    FieldValue hiboutikIdVendeurFieldValue,
    FieldValue hiboutikWebHookFieldValue,
    FieldValue hiboutikWebHookCreationArticleFieldValue,
    FieldValue urlWixFieldValue,
    FieldValue wixSiteIdFieldValue,
    FieldValue wixApiKeyFieldValue,
    FieldValue wixWebHookFieldValue,
  });

  /// Writes to the document using the batch API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void batchSet(
    WriteBatch batch,
    CompteUtilisateur model, {
    SetOptions? options,
    FieldValue emailFieldValue,
    FieldValue dateCreationFieldValue,
    FieldValue dateValiditerFieldValue,
    FieldValue hiboutikEmailFieldValue,
    FieldValue hiboutikMotDePasseFieldValue,
    FieldValue urlHiboutikFieldValue,
    FieldValue hiboutikIdVendeurFieldValue,
    FieldValue hiboutikWebHookFieldValue,
    FieldValue hiboutikWebHookCreationArticleFieldValue,
    FieldValue urlWixFieldValue,
    FieldValue wixSiteIdFieldValue,
    FieldValue wixApiKeyFieldValue,
    FieldValue wixWebHookFieldValue,
  });

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String email,
    FieldValue emailFieldValue,
    DateTime dateCreation,
    FieldValue dateCreationFieldValue,
    DateTime? dateValiditer,
    FieldValue dateValiditerFieldValue,
    String hiboutikEmail,
    FieldValue hiboutikEmailFieldValue,
    String hiboutikMotDePasse,
    FieldValue hiboutikMotDePasseFieldValue,
    String urlHiboutik,
    FieldValue urlHiboutikFieldValue,
    String hiboutikIdVendeur,
    FieldValue hiboutikIdVendeurFieldValue,
    String hiboutikWebHook,
    FieldValue hiboutikWebHookFieldValue,
    String hiboutikWebHookCreationArticle,
    FieldValue hiboutikWebHookCreationArticleFieldValue,
    String urlWix,
    FieldValue urlWixFieldValue,
    String wixSiteId,
    FieldValue wixSiteIdFieldValue,
    String wixApiKey,
    FieldValue wixApiKeyFieldValue,
    String wixWebHook,
    FieldValue wixWebHookFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String email,
    FieldValue emailFieldValue,
    DateTime dateCreation,
    FieldValue dateCreationFieldValue,
    DateTime? dateValiditer,
    FieldValue dateValiditerFieldValue,
    String hiboutikEmail,
    FieldValue hiboutikEmailFieldValue,
    String hiboutikMotDePasse,
    FieldValue hiboutikMotDePasseFieldValue,
    String urlHiboutik,
    FieldValue urlHiboutikFieldValue,
    String hiboutikIdVendeur,
    FieldValue hiboutikIdVendeurFieldValue,
    String hiboutikWebHook,
    FieldValue hiboutikWebHookFieldValue,
    String hiboutikWebHookCreationArticle,
    FieldValue hiboutikWebHookCreationArticleFieldValue,
    String urlWix,
    FieldValue urlWixFieldValue,
    String wixSiteId,
    FieldValue wixSiteIdFieldValue,
    String wixApiKey,
    FieldValue wixApiKeyFieldValue,
    String wixWebHook,
    FieldValue wixWebHookFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    String email,
    FieldValue emailFieldValue,
    DateTime dateCreation,
    FieldValue dateCreationFieldValue,
    DateTime? dateValiditer,
    FieldValue dateValiditerFieldValue,
    String hiboutikEmail,
    FieldValue hiboutikEmailFieldValue,
    String hiboutikMotDePasse,
    FieldValue hiboutikMotDePasseFieldValue,
    String urlHiboutik,
    FieldValue urlHiboutikFieldValue,
    String hiboutikIdVendeur,
    FieldValue hiboutikIdVendeurFieldValue,
    String hiboutikWebHook,
    FieldValue hiboutikWebHookFieldValue,
    String hiboutikWebHookCreationArticle,
    FieldValue hiboutikWebHookCreationArticleFieldValue,
    String urlWix,
    FieldValue urlWixFieldValue,
    String wixSiteId,
    FieldValue wixSiteIdFieldValue,
    String wixApiKey,
    FieldValue wixApiKeyFieldValue,
    String wixWebHook,
    FieldValue wixWebHookFieldValue,
  });
}

class _$CompteUtilisateurDocumentReference extends FirestoreDocumentReference<
        CompteUtilisateur, CompteUtilisateurDocumentSnapshot>
    implements CompteUtilisateurDocumentReference {
  _$CompteUtilisateurDocumentReference(this.reference);

  @override
  final DocumentReference<CompteUtilisateur> reference;

  /// A reference to the [CompteUtilisateurCollectionReference] containing this document.
  CompteUtilisateurCollectionReference get parent {
    return _$CompteUtilisateurCollectionReference(reference.firestore);
  }

  @override
  Stream<CompteUtilisateurDocumentSnapshot> snapshots() {
    return reference.snapshots().map(CompteUtilisateurDocumentSnapshot._);
  }

  @override
  Future<CompteUtilisateurDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(CompteUtilisateurDocumentSnapshot._);
  }

  @override
  Future<CompteUtilisateurDocumentSnapshot> transactionGet(
      Transaction transaction) {
    return transaction.get(reference).then(CompteUtilisateurDocumentSnapshot._);
  }

  Future<void> set(
    CompteUtilisateur model, {
    SetOptions? options,
    FieldValue? emailFieldValue,
    FieldValue? dateCreationFieldValue,
    FieldValue? dateValiditerFieldValue,
    FieldValue? hiboutikEmailFieldValue,
    FieldValue? hiboutikMotDePasseFieldValue,
    FieldValue? urlHiboutikFieldValue,
    FieldValue? hiboutikIdVendeurFieldValue,
    FieldValue? hiboutikWebHookFieldValue,
    FieldValue? hiboutikWebHookCreationArticleFieldValue,
    FieldValue? urlWixFieldValue,
    FieldValue? wixSiteIdFieldValue,
    FieldValue? wixApiKeyFieldValue,
    FieldValue? wixWebHookFieldValue,
  }) async {
    final json = {
      ...model.toJson(),
      if (emailFieldValue != null)
        _$CompteUtilisateurFieldMap['email']!: emailFieldValue,
      if (dateCreationFieldValue != null)
        _$CompteUtilisateurFieldMap['dateCreation']!: dateCreationFieldValue,
      if (dateValiditerFieldValue != null)
        _$CompteUtilisateurFieldMap['dateValiditer']!: dateValiditerFieldValue,
      if (hiboutikEmailFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikEmail']!: hiboutikEmailFieldValue,
      if (hiboutikMotDePasseFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikMotDePasse']!:
            hiboutikMotDePasseFieldValue,
      if (urlHiboutikFieldValue != null)
        _$CompteUtilisateurFieldMap['urlHiboutik']!: urlHiboutikFieldValue,
      if (hiboutikIdVendeurFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikIdVendeur']!:
            hiboutikIdVendeurFieldValue,
      if (hiboutikWebHookFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikWebHook']!:
            hiboutikWebHookFieldValue,
      if (hiboutikWebHookCreationArticleFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikWebHookCreationArticle']!:
            hiboutikWebHookCreationArticleFieldValue,
      if (urlWixFieldValue != null)
        _$CompteUtilisateurFieldMap['urlWix']!: urlWixFieldValue,
      if (wixSiteIdFieldValue != null)
        _$CompteUtilisateurFieldMap['wixSiteId']!: wixSiteIdFieldValue,
      if (wixApiKeyFieldValue != null)
        _$CompteUtilisateurFieldMap['wixApiKey']!: wixApiKeyFieldValue,
      if (wixWebHookFieldValue != null)
        _$CompteUtilisateurFieldMap['wixWebHook']!: wixWebHookFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => throw UnimplementedError(),
      toFirestore: (value, options) => value,
    );
    return castedReference.set(json, options);
  }

  void transactionSet(
    Transaction transaction,
    CompteUtilisateur model, {
    SetOptions? options,
    FieldValue? emailFieldValue,
    FieldValue? dateCreationFieldValue,
    FieldValue? dateValiditerFieldValue,
    FieldValue? hiboutikEmailFieldValue,
    FieldValue? hiboutikMotDePasseFieldValue,
    FieldValue? urlHiboutikFieldValue,
    FieldValue? hiboutikIdVendeurFieldValue,
    FieldValue? hiboutikWebHookFieldValue,
    FieldValue? hiboutikWebHookCreationArticleFieldValue,
    FieldValue? urlWixFieldValue,
    FieldValue? wixSiteIdFieldValue,
    FieldValue? wixApiKeyFieldValue,
    FieldValue? wixWebHookFieldValue,
  }) {
    final json = {
      ...model.toJson(),
      if (emailFieldValue != null)
        _$CompteUtilisateurFieldMap['email']!: emailFieldValue,
      if (dateCreationFieldValue != null)
        _$CompteUtilisateurFieldMap['dateCreation']!: dateCreationFieldValue,
      if (dateValiditerFieldValue != null)
        _$CompteUtilisateurFieldMap['dateValiditer']!: dateValiditerFieldValue,
      if (hiboutikEmailFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikEmail']!: hiboutikEmailFieldValue,
      if (hiboutikMotDePasseFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikMotDePasse']!:
            hiboutikMotDePasseFieldValue,
      if (urlHiboutikFieldValue != null)
        _$CompteUtilisateurFieldMap['urlHiboutik']!: urlHiboutikFieldValue,
      if (hiboutikIdVendeurFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikIdVendeur']!:
            hiboutikIdVendeurFieldValue,
      if (hiboutikWebHookFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikWebHook']!:
            hiboutikWebHookFieldValue,
      if (hiboutikWebHookCreationArticleFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikWebHookCreationArticle']!:
            hiboutikWebHookCreationArticleFieldValue,
      if (urlWixFieldValue != null)
        _$CompteUtilisateurFieldMap['urlWix']!: urlWixFieldValue,
      if (wixSiteIdFieldValue != null)
        _$CompteUtilisateurFieldMap['wixSiteId']!: wixSiteIdFieldValue,
      if (wixApiKeyFieldValue != null)
        _$CompteUtilisateurFieldMap['wixApiKey']!: wixApiKeyFieldValue,
      if (wixWebHookFieldValue != null)
        _$CompteUtilisateurFieldMap['wixWebHook']!: wixWebHookFieldValue,
    };

    transaction.set(reference, json, options);
  }

  void batchSet(
    WriteBatch batch,
    CompteUtilisateur model, {
    SetOptions? options,
    FieldValue? emailFieldValue,
    FieldValue? dateCreationFieldValue,
    FieldValue? dateValiditerFieldValue,
    FieldValue? hiboutikEmailFieldValue,
    FieldValue? hiboutikMotDePasseFieldValue,
    FieldValue? urlHiboutikFieldValue,
    FieldValue? hiboutikIdVendeurFieldValue,
    FieldValue? hiboutikWebHookFieldValue,
    FieldValue? hiboutikWebHookCreationArticleFieldValue,
    FieldValue? urlWixFieldValue,
    FieldValue? wixSiteIdFieldValue,
    FieldValue? wixApiKeyFieldValue,
    FieldValue? wixWebHookFieldValue,
  }) {
    final json = {
      ...model.toJson(),
      if (emailFieldValue != null)
        _$CompteUtilisateurFieldMap['email']!: emailFieldValue,
      if (dateCreationFieldValue != null)
        _$CompteUtilisateurFieldMap['dateCreation']!: dateCreationFieldValue,
      if (dateValiditerFieldValue != null)
        _$CompteUtilisateurFieldMap['dateValiditer']!: dateValiditerFieldValue,
      if (hiboutikEmailFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikEmail']!: hiboutikEmailFieldValue,
      if (hiboutikMotDePasseFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikMotDePasse']!:
            hiboutikMotDePasseFieldValue,
      if (urlHiboutikFieldValue != null)
        _$CompteUtilisateurFieldMap['urlHiboutik']!: urlHiboutikFieldValue,
      if (hiboutikIdVendeurFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikIdVendeur']!:
            hiboutikIdVendeurFieldValue,
      if (hiboutikWebHookFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikWebHook']!:
            hiboutikWebHookFieldValue,
      if (hiboutikWebHookCreationArticleFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikWebHookCreationArticle']!:
            hiboutikWebHookCreationArticleFieldValue,
      if (urlWixFieldValue != null)
        _$CompteUtilisateurFieldMap['urlWix']!: urlWixFieldValue,
      if (wixSiteIdFieldValue != null)
        _$CompteUtilisateurFieldMap['wixSiteId']!: wixSiteIdFieldValue,
      if (wixApiKeyFieldValue != null)
        _$CompteUtilisateurFieldMap['wixApiKey']!: wixApiKeyFieldValue,
      if (wixWebHookFieldValue != null)
        _$CompteUtilisateurFieldMap['wixWebHook']!: wixWebHookFieldValue,
    };

    batch.set(reference, json, options);
  }

  Future<void> update({
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? dateCreation = _sentinel,
    FieldValue? dateCreationFieldValue,
    Object? dateValiditer = _sentinel,
    FieldValue? dateValiditerFieldValue,
    Object? hiboutikEmail = _sentinel,
    FieldValue? hiboutikEmailFieldValue,
    Object? hiboutikMotDePasse = _sentinel,
    FieldValue? hiboutikMotDePasseFieldValue,
    Object? urlHiboutik = _sentinel,
    FieldValue? urlHiboutikFieldValue,
    Object? hiboutikIdVendeur = _sentinel,
    FieldValue? hiboutikIdVendeurFieldValue,
    Object? hiboutikWebHook = _sentinel,
    FieldValue? hiboutikWebHookFieldValue,
    Object? hiboutikWebHookCreationArticle = _sentinel,
    FieldValue? hiboutikWebHookCreationArticleFieldValue,
    Object? urlWix = _sentinel,
    FieldValue? urlWixFieldValue,
    Object? wixSiteId = _sentinel,
    FieldValue? wixSiteIdFieldValue,
    Object? wixApiKey = _sentinel,
    FieldValue? wixApiKeyFieldValue,
    Object? wixWebHook = _sentinel,
    FieldValue? wixWebHookFieldValue,
  }) async {
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      dateCreation == _sentinel || dateCreationFieldValue == null,
      "Cannot specify both dateCreation and dateCreationFieldValue",
    );
    assert(
      dateValiditer == _sentinel || dateValiditerFieldValue == null,
      "Cannot specify both dateValiditer and dateValiditerFieldValue",
    );
    assert(
      hiboutikEmail == _sentinel || hiboutikEmailFieldValue == null,
      "Cannot specify both hiboutikEmail and hiboutikEmailFieldValue",
    );
    assert(
      hiboutikMotDePasse == _sentinel || hiboutikMotDePasseFieldValue == null,
      "Cannot specify both hiboutikMotDePasse and hiboutikMotDePasseFieldValue",
    );
    assert(
      urlHiboutik == _sentinel || urlHiboutikFieldValue == null,
      "Cannot specify both urlHiboutik and urlHiboutikFieldValue",
    );
    assert(
      hiboutikIdVendeur == _sentinel || hiboutikIdVendeurFieldValue == null,
      "Cannot specify both hiboutikIdVendeur and hiboutikIdVendeurFieldValue",
    );
    assert(
      hiboutikWebHook == _sentinel || hiboutikWebHookFieldValue == null,
      "Cannot specify both hiboutikWebHook and hiboutikWebHookFieldValue",
    );
    assert(
      hiboutikWebHookCreationArticle == _sentinel ||
          hiboutikWebHookCreationArticleFieldValue == null,
      "Cannot specify both hiboutikWebHookCreationArticle and hiboutikWebHookCreationArticleFieldValue",
    );
    assert(
      urlWix == _sentinel || urlWixFieldValue == null,
      "Cannot specify both urlWix and urlWixFieldValue",
    );
    assert(
      wixSiteId == _sentinel || wixSiteIdFieldValue == null,
      "Cannot specify both wixSiteId and wixSiteIdFieldValue",
    );
    assert(
      wixApiKey == _sentinel || wixApiKeyFieldValue == null,
      "Cannot specify both wixApiKey and wixApiKeyFieldValue",
    );
    assert(
      wixWebHook == _sentinel || wixWebHookFieldValue == null,
      "Cannot specify both wixWebHook and wixWebHookFieldValue",
    );
    final json = {
      if (email != _sentinel)
        _$CompteUtilisateurFieldMap['email']!:
            _$CompteUtilisateurPerFieldToJson.email(email as String),
      if (emailFieldValue != null)
        _$CompteUtilisateurFieldMap['email']!: emailFieldValue,
      if (dateCreation != _sentinel)
        _$CompteUtilisateurFieldMap['dateCreation']!:
            _$CompteUtilisateurPerFieldToJson
                .dateCreation(dateCreation as DateTime),
      if (dateCreationFieldValue != null)
        _$CompteUtilisateurFieldMap['dateCreation']!: dateCreationFieldValue,
      if (dateValiditer != _sentinel)
        _$CompteUtilisateurFieldMap['dateValiditer']!:
            _$CompteUtilisateurPerFieldToJson
                .dateValiditer(dateValiditer as DateTime?),
      if (dateValiditerFieldValue != null)
        _$CompteUtilisateurFieldMap['dateValiditer']!: dateValiditerFieldValue,
      if (hiboutikEmail != _sentinel)
        _$CompteUtilisateurFieldMap['hiboutikEmail']!:
            _$CompteUtilisateurPerFieldToJson
                .hiboutikEmail(hiboutikEmail as String),
      if (hiboutikEmailFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikEmail']!: hiboutikEmailFieldValue,
      if (hiboutikMotDePasse != _sentinel)
        _$CompteUtilisateurFieldMap['hiboutikMotDePasse']!:
            _$CompteUtilisateurPerFieldToJson
                .hiboutikMotDePasse(hiboutikMotDePasse as String),
      if (hiboutikMotDePasseFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikMotDePasse']!:
            hiboutikMotDePasseFieldValue,
      if (urlHiboutik != _sentinel)
        _$CompteUtilisateurFieldMap['urlHiboutik']!:
            _$CompteUtilisateurPerFieldToJson
                .urlHiboutik(urlHiboutik as String),
      if (urlHiboutikFieldValue != null)
        _$CompteUtilisateurFieldMap['urlHiboutik']!: urlHiboutikFieldValue,
      if (hiboutikIdVendeur != _sentinel)
        _$CompteUtilisateurFieldMap['hiboutikIdVendeur']!:
            _$CompteUtilisateurPerFieldToJson
                .hiboutikIdVendeur(hiboutikIdVendeur as String),
      if (hiboutikIdVendeurFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikIdVendeur']!:
            hiboutikIdVendeurFieldValue,
      if (hiboutikWebHook != _sentinel)
        _$CompteUtilisateurFieldMap['hiboutikWebHook']!:
            _$CompteUtilisateurPerFieldToJson
                .hiboutikWebHook(hiboutikWebHook as String),
      if (hiboutikWebHookFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikWebHook']!:
            hiboutikWebHookFieldValue,
      if (hiboutikWebHookCreationArticle != _sentinel)
        _$CompteUtilisateurFieldMap['hiboutikWebHookCreationArticle']!:
            _$CompteUtilisateurPerFieldToJson.hiboutikWebHookCreationArticle(
                hiboutikWebHookCreationArticle as String),
      if (hiboutikWebHookCreationArticleFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikWebHookCreationArticle']!:
            hiboutikWebHookCreationArticleFieldValue,
      if (urlWix != _sentinel)
        _$CompteUtilisateurFieldMap['urlWix']!:
            _$CompteUtilisateurPerFieldToJson.urlWix(urlWix as String),
      if (urlWixFieldValue != null)
        _$CompteUtilisateurFieldMap['urlWix']!: urlWixFieldValue,
      if (wixSiteId != _sentinel)
        _$CompteUtilisateurFieldMap['wixSiteId']!:
            _$CompteUtilisateurPerFieldToJson.wixSiteId(wixSiteId as String),
      if (wixSiteIdFieldValue != null)
        _$CompteUtilisateurFieldMap['wixSiteId']!: wixSiteIdFieldValue,
      if (wixApiKey != _sentinel)
        _$CompteUtilisateurFieldMap['wixApiKey']!:
            _$CompteUtilisateurPerFieldToJson.wixApiKey(wixApiKey as String),
      if (wixApiKeyFieldValue != null)
        _$CompteUtilisateurFieldMap['wixApiKey']!: wixApiKeyFieldValue,
      if (wixWebHook != _sentinel)
        _$CompteUtilisateurFieldMap['wixWebHook']!:
            _$CompteUtilisateurPerFieldToJson.wixWebHook(wixWebHook as String),
      if (wixWebHookFieldValue != null)
        _$CompteUtilisateurFieldMap['wixWebHook']!: wixWebHookFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? dateCreation = _sentinel,
    FieldValue? dateCreationFieldValue,
    Object? dateValiditer = _sentinel,
    FieldValue? dateValiditerFieldValue,
    Object? hiboutikEmail = _sentinel,
    FieldValue? hiboutikEmailFieldValue,
    Object? hiboutikMotDePasse = _sentinel,
    FieldValue? hiboutikMotDePasseFieldValue,
    Object? urlHiboutik = _sentinel,
    FieldValue? urlHiboutikFieldValue,
    Object? hiboutikIdVendeur = _sentinel,
    FieldValue? hiboutikIdVendeurFieldValue,
    Object? hiboutikWebHook = _sentinel,
    FieldValue? hiboutikWebHookFieldValue,
    Object? hiboutikWebHookCreationArticle = _sentinel,
    FieldValue? hiboutikWebHookCreationArticleFieldValue,
    Object? urlWix = _sentinel,
    FieldValue? urlWixFieldValue,
    Object? wixSiteId = _sentinel,
    FieldValue? wixSiteIdFieldValue,
    Object? wixApiKey = _sentinel,
    FieldValue? wixApiKeyFieldValue,
    Object? wixWebHook = _sentinel,
    FieldValue? wixWebHookFieldValue,
  }) {
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      dateCreation == _sentinel || dateCreationFieldValue == null,
      "Cannot specify both dateCreation and dateCreationFieldValue",
    );
    assert(
      dateValiditer == _sentinel || dateValiditerFieldValue == null,
      "Cannot specify both dateValiditer and dateValiditerFieldValue",
    );
    assert(
      hiboutikEmail == _sentinel || hiboutikEmailFieldValue == null,
      "Cannot specify both hiboutikEmail and hiboutikEmailFieldValue",
    );
    assert(
      hiboutikMotDePasse == _sentinel || hiboutikMotDePasseFieldValue == null,
      "Cannot specify both hiboutikMotDePasse and hiboutikMotDePasseFieldValue",
    );
    assert(
      urlHiboutik == _sentinel || urlHiboutikFieldValue == null,
      "Cannot specify both urlHiboutik and urlHiboutikFieldValue",
    );
    assert(
      hiboutikIdVendeur == _sentinel || hiboutikIdVendeurFieldValue == null,
      "Cannot specify both hiboutikIdVendeur and hiboutikIdVendeurFieldValue",
    );
    assert(
      hiboutikWebHook == _sentinel || hiboutikWebHookFieldValue == null,
      "Cannot specify both hiboutikWebHook and hiboutikWebHookFieldValue",
    );
    assert(
      hiboutikWebHookCreationArticle == _sentinel ||
          hiboutikWebHookCreationArticleFieldValue == null,
      "Cannot specify both hiboutikWebHookCreationArticle and hiboutikWebHookCreationArticleFieldValue",
    );
    assert(
      urlWix == _sentinel || urlWixFieldValue == null,
      "Cannot specify both urlWix and urlWixFieldValue",
    );
    assert(
      wixSiteId == _sentinel || wixSiteIdFieldValue == null,
      "Cannot specify both wixSiteId and wixSiteIdFieldValue",
    );
    assert(
      wixApiKey == _sentinel || wixApiKeyFieldValue == null,
      "Cannot specify both wixApiKey and wixApiKeyFieldValue",
    );
    assert(
      wixWebHook == _sentinel || wixWebHookFieldValue == null,
      "Cannot specify both wixWebHook and wixWebHookFieldValue",
    );
    final json = {
      if (email != _sentinel)
        _$CompteUtilisateurFieldMap['email']!:
            _$CompteUtilisateurPerFieldToJson.email(email as String),
      if (emailFieldValue != null)
        _$CompteUtilisateurFieldMap['email']!: emailFieldValue,
      if (dateCreation != _sentinel)
        _$CompteUtilisateurFieldMap['dateCreation']!:
            _$CompteUtilisateurPerFieldToJson
                .dateCreation(dateCreation as DateTime),
      if (dateCreationFieldValue != null)
        _$CompteUtilisateurFieldMap['dateCreation']!: dateCreationFieldValue,
      if (dateValiditer != _sentinel)
        _$CompteUtilisateurFieldMap['dateValiditer']!:
            _$CompteUtilisateurPerFieldToJson
                .dateValiditer(dateValiditer as DateTime?),
      if (dateValiditerFieldValue != null)
        _$CompteUtilisateurFieldMap['dateValiditer']!: dateValiditerFieldValue,
      if (hiboutikEmail != _sentinel)
        _$CompteUtilisateurFieldMap['hiboutikEmail']!:
            _$CompteUtilisateurPerFieldToJson
                .hiboutikEmail(hiboutikEmail as String),
      if (hiboutikEmailFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikEmail']!: hiboutikEmailFieldValue,
      if (hiboutikMotDePasse != _sentinel)
        _$CompteUtilisateurFieldMap['hiboutikMotDePasse']!:
            _$CompteUtilisateurPerFieldToJson
                .hiboutikMotDePasse(hiboutikMotDePasse as String),
      if (hiboutikMotDePasseFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikMotDePasse']!:
            hiboutikMotDePasseFieldValue,
      if (urlHiboutik != _sentinel)
        _$CompteUtilisateurFieldMap['urlHiboutik']!:
            _$CompteUtilisateurPerFieldToJson
                .urlHiboutik(urlHiboutik as String),
      if (urlHiboutikFieldValue != null)
        _$CompteUtilisateurFieldMap['urlHiboutik']!: urlHiboutikFieldValue,
      if (hiboutikIdVendeur != _sentinel)
        _$CompteUtilisateurFieldMap['hiboutikIdVendeur']!:
            _$CompteUtilisateurPerFieldToJson
                .hiboutikIdVendeur(hiboutikIdVendeur as String),
      if (hiboutikIdVendeurFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikIdVendeur']!:
            hiboutikIdVendeurFieldValue,
      if (hiboutikWebHook != _sentinel)
        _$CompteUtilisateurFieldMap['hiboutikWebHook']!:
            _$CompteUtilisateurPerFieldToJson
                .hiboutikWebHook(hiboutikWebHook as String),
      if (hiboutikWebHookFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikWebHook']!:
            hiboutikWebHookFieldValue,
      if (hiboutikWebHookCreationArticle != _sentinel)
        _$CompteUtilisateurFieldMap['hiboutikWebHookCreationArticle']!:
            _$CompteUtilisateurPerFieldToJson.hiboutikWebHookCreationArticle(
                hiboutikWebHookCreationArticle as String),
      if (hiboutikWebHookCreationArticleFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikWebHookCreationArticle']!:
            hiboutikWebHookCreationArticleFieldValue,
      if (urlWix != _sentinel)
        _$CompteUtilisateurFieldMap['urlWix']!:
            _$CompteUtilisateurPerFieldToJson.urlWix(urlWix as String),
      if (urlWixFieldValue != null)
        _$CompteUtilisateurFieldMap['urlWix']!: urlWixFieldValue,
      if (wixSiteId != _sentinel)
        _$CompteUtilisateurFieldMap['wixSiteId']!:
            _$CompteUtilisateurPerFieldToJson.wixSiteId(wixSiteId as String),
      if (wixSiteIdFieldValue != null)
        _$CompteUtilisateurFieldMap['wixSiteId']!: wixSiteIdFieldValue,
      if (wixApiKey != _sentinel)
        _$CompteUtilisateurFieldMap['wixApiKey']!:
            _$CompteUtilisateurPerFieldToJson.wixApiKey(wixApiKey as String),
      if (wixApiKeyFieldValue != null)
        _$CompteUtilisateurFieldMap['wixApiKey']!: wixApiKeyFieldValue,
      if (wixWebHook != _sentinel)
        _$CompteUtilisateurFieldMap['wixWebHook']!:
            _$CompteUtilisateurPerFieldToJson.wixWebHook(wixWebHook as String),
      if (wixWebHookFieldValue != null)
        _$CompteUtilisateurFieldMap['wixWebHook']!: wixWebHookFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? dateCreation = _sentinel,
    FieldValue? dateCreationFieldValue,
    Object? dateValiditer = _sentinel,
    FieldValue? dateValiditerFieldValue,
    Object? hiboutikEmail = _sentinel,
    FieldValue? hiboutikEmailFieldValue,
    Object? hiboutikMotDePasse = _sentinel,
    FieldValue? hiboutikMotDePasseFieldValue,
    Object? urlHiboutik = _sentinel,
    FieldValue? urlHiboutikFieldValue,
    Object? hiboutikIdVendeur = _sentinel,
    FieldValue? hiboutikIdVendeurFieldValue,
    Object? hiboutikWebHook = _sentinel,
    FieldValue? hiboutikWebHookFieldValue,
    Object? hiboutikWebHookCreationArticle = _sentinel,
    FieldValue? hiboutikWebHookCreationArticleFieldValue,
    Object? urlWix = _sentinel,
    FieldValue? urlWixFieldValue,
    Object? wixSiteId = _sentinel,
    FieldValue? wixSiteIdFieldValue,
    Object? wixApiKey = _sentinel,
    FieldValue? wixApiKeyFieldValue,
    Object? wixWebHook = _sentinel,
    FieldValue? wixWebHookFieldValue,
  }) {
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      dateCreation == _sentinel || dateCreationFieldValue == null,
      "Cannot specify both dateCreation and dateCreationFieldValue",
    );
    assert(
      dateValiditer == _sentinel || dateValiditerFieldValue == null,
      "Cannot specify both dateValiditer and dateValiditerFieldValue",
    );
    assert(
      hiboutikEmail == _sentinel || hiboutikEmailFieldValue == null,
      "Cannot specify both hiboutikEmail and hiboutikEmailFieldValue",
    );
    assert(
      hiboutikMotDePasse == _sentinel || hiboutikMotDePasseFieldValue == null,
      "Cannot specify both hiboutikMotDePasse and hiboutikMotDePasseFieldValue",
    );
    assert(
      urlHiboutik == _sentinel || urlHiboutikFieldValue == null,
      "Cannot specify both urlHiboutik and urlHiboutikFieldValue",
    );
    assert(
      hiboutikIdVendeur == _sentinel || hiboutikIdVendeurFieldValue == null,
      "Cannot specify both hiboutikIdVendeur and hiboutikIdVendeurFieldValue",
    );
    assert(
      hiboutikWebHook == _sentinel || hiboutikWebHookFieldValue == null,
      "Cannot specify both hiboutikWebHook and hiboutikWebHookFieldValue",
    );
    assert(
      hiboutikWebHookCreationArticle == _sentinel ||
          hiboutikWebHookCreationArticleFieldValue == null,
      "Cannot specify both hiboutikWebHookCreationArticle and hiboutikWebHookCreationArticleFieldValue",
    );
    assert(
      urlWix == _sentinel || urlWixFieldValue == null,
      "Cannot specify both urlWix and urlWixFieldValue",
    );
    assert(
      wixSiteId == _sentinel || wixSiteIdFieldValue == null,
      "Cannot specify both wixSiteId and wixSiteIdFieldValue",
    );
    assert(
      wixApiKey == _sentinel || wixApiKeyFieldValue == null,
      "Cannot specify both wixApiKey and wixApiKeyFieldValue",
    );
    assert(
      wixWebHook == _sentinel || wixWebHookFieldValue == null,
      "Cannot specify both wixWebHook and wixWebHookFieldValue",
    );
    final json = {
      if (email != _sentinel)
        _$CompteUtilisateurFieldMap['email']!:
            _$CompteUtilisateurPerFieldToJson.email(email as String),
      if (emailFieldValue != null)
        _$CompteUtilisateurFieldMap['email']!: emailFieldValue,
      if (dateCreation != _sentinel)
        _$CompteUtilisateurFieldMap['dateCreation']!:
            _$CompteUtilisateurPerFieldToJson
                .dateCreation(dateCreation as DateTime),
      if (dateCreationFieldValue != null)
        _$CompteUtilisateurFieldMap['dateCreation']!: dateCreationFieldValue,
      if (dateValiditer != _sentinel)
        _$CompteUtilisateurFieldMap['dateValiditer']!:
            _$CompteUtilisateurPerFieldToJson
                .dateValiditer(dateValiditer as DateTime?),
      if (dateValiditerFieldValue != null)
        _$CompteUtilisateurFieldMap['dateValiditer']!: dateValiditerFieldValue,
      if (hiboutikEmail != _sentinel)
        _$CompteUtilisateurFieldMap['hiboutikEmail']!:
            _$CompteUtilisateurPerFieldToJson
                .hiboutikEmail(hiboutikEmail as String),
      if (hiboutikEmailFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikEmail']!: hiboutikEmailFieldValue,
      if (hiboutikMotDePasse != _sentinel)
        _$CompteUtilisateurFieldMap['hiboutikMotDePasse']!:
            _$CompteUtilisateurPerFieldToJson
                .hiboutikMotDePasse(hiboutikMotDePasse as String),
      if (hiboutikMotDePasseFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikMotDePasse']!:
            hiboutikMotDePasseFieldValue,
      if (urlHiboutik != _sentinel)
        _$CompteUtilisateurFieldMap['urlHiboutik']!:
            _$CompteUtilisateurPerFieldToJson
                .urlHiboutik(urlHiboutik as String),
      if (urlHiboutikFieldValue != null)
        _$CompteUtilisateurFieldMap['urlHiboutik']!: urlHiboutikFieldValue,
      if (hiboutikIdVendeur != _sentinel)
        _$CompteUtilisateurFieldMap['hiboutikIdVendeur']!:
            _$CompteUtilisateurPerFieldToJson
                .hiboutikIdVendeur(hiboutikIdVendeur as String),
      if (hiboutikIdVendeurFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikIdVendeur']!:
            hiboutikIdVendeurFieldValue,
      if (hiboutikWebHook != _sentinel)
        _$CompteUtilisateurFieldMap['hiboutikWebHook']!:
            _$CompteUtilisateurPerFieldToJson
                .hiboutikWebHook(hiboutikWebHook as String),
      if (hiboutikWebHookFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikWebHook']!:
            hiboutikWebHookFieldValue,
      if (hiboutikWebHookCreationArticle != _sentinel)
        _$CompteUtilisateurFieldMap['hiboutikWebHookCreationArticle']!:
            _$CompteUtilisateurPerFieldToJson.hiboutikWebHookCreationArticle(
                hiboutikWebHookCreationArticle as String),
      if (hiboutikWebHookCreationArticleFieldValue != null)
        _$CompteUtilisateurFieldMap['hiboutikWebHookCreationArticle']!:
            hiboutikWebHookCreationArticleFieldValue,
      if (urlWix != _sentinel)
        _$CompteUtilisateurFieldMap['urlWix']!:
            _$CompteUtilisateurPerFieldToJson.urlWix(urlWix as String),
      if (urlWixFieldValue != null)
        _$CompteUtilisateurFieldMap['urlWix']!: urlWixFieldValue,
      if (wixSiteId != _sentinel)
        _$CompteUtilisateurFieldMap['wixSiteId']!:
            _$CompteUtilisateurPerFieldToJson.wixSiteId(wixSiteId as String),
      if (wixSiteIdFieldValue != null)
        _$CompteUtilisateurFieldMap['wixSiteId']!: wixSiteIdFieldValue,
      if (wixApiKey != _sentinel)
        _$CompteUtilisateurFieldMap['wixApiKey']!:
            _$CompteUtilisateurPerFieldToJson.wixApiKey(wixApiKey as String),
      if (wixApiKeyFieldValue != null)
        _$CompteUtilisateurFieldMap['wixApiKey']!: wixApiKeyFieldValue,
      if (wixWebHook != _sentinel)
        _$CompteUtilisateurFieldMap['wixWebHook']!:
            _$CompteUtilisateurPerFieldToJson.wixWebHook(wixWebHook as String),
      if (wixWebHookFieldValue != null)
        _$CompteUtilisateurFieldMap['wixWebHook']!: wixWebHookFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is CompteUtilisateurDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class CompteUtilisateurQuery
    implements
        QueryReference<CompteUtilisateur, CompteUtilisateurQuerySnapshot> {
  @override
  CompteUtilisateurQuery limit(int limit);

  @override
  CompteUtilisateurQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  CompteUtilisateurQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  CompteUtilisateurQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  CompteUtilisateurQuery whereEmail({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  CompteUtilisateurQuery whereDateCreation({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  });

  CompteUtilisateurQuery whereDateValiditer({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
    bool? isNull,
  });

  CompteUtilisateurQuery whereHiboutikEmail({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  CompteUtilisateurQuery whereHiboutikMotDePasse({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  CompteUtilisateurQuery whereUrlHiboutik({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  CompteUtilisateurQuery whereHiboutikIdVendeur({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  CompteUtilisateurQuery whereHiboutikWebHook({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  CompteUtilisateurQuery whereHiboutikWebHookCreationArticle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  CompteUtilisateurQuery whereUrlWix({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  CompteUtilisateurQuery whereWixSiteId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  CompteUtilisateurQuery whereWixApiKey({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  CompteUtilisateurQuery whereWixWebHook({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  CompteUtilisateurQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  });

  CompteUtilisateurQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  });

  CompteUtilisateurQuery orderByEmail({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  });

  CompteUtilisateurQuery orderByDateCreation({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  });

  CompteUtilisateurQuery orderByDateValiditer({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  });

  CompteUtilisateurQuery orderByHiboutikEmail({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  });

  CompteUtilisateurQuery orderByHiboutikMotDePasse({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  });

  CompteUtilisateurQuery orderByUrlHiboutik({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  });

  CompteUtilisateurQuery orderByHiboutikIdVendeur({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  });

  CompteUtilisateurQuery orderByHiboutikWebHook({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  });

  CompteUtilisateurQuery orderByHiboutikWebHookCreationArticle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  });

  CompteUtilisateurQuery orderByUrlWix({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  });

  CompteUtilisateurQuery orderByWixSiteId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  });

  CompteUtilisateurQuery orderByWixApiKey({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  });

  CompteUtilisateurQuery orderByWixWebHook({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  });
}

class _$CompteUtilisateurQuery
    extends QueryReference<CompteUtilisateur, CompteUtilisateurQuerySnapshot>
    implements CompteUtilisateurQuery {
  _$CompteUtilisateurQuery(
    this._collection, {
    required Query<CompteUtilisateur> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<CompteUtilisateurQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(CompteUtilisateurQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<CompteUtilisateurQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(CompteUtilisateurQuerySnapshot._fromQuerySnapshot);
  }

  @override
  CompteUtilisateurQuery limit(int limit) {
    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery limitToLast(int limit) {
    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery whereEmail({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CompteUtilisateurFieldMap['email']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson.email(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson.email(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$CompteUtilisateurPerFieldToJson.email(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .email(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$CompteUtilisateurPerFieldToJson.email(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .email(isGreaterThanOrEqualTo as String)
            : null,
        whereIn:
            whereIn?.map((e) => _$CompteUtilisateurPerFieldToJson.email(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$CompteUtilisateurPerFieldToJson.email(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery whereDateCreation({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  }) {
    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CompteUtilisateurFieldMap['dateCreation']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson
                .dateCreation(isEqualTo as DateTime)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson
                .dateCreation(isNotEqualTo as DateTime)
            : null,
        isLessThan: isLessThan != null
            ? _$CompteUtilisateurPerFieldToJson
                .dateCreation(isLessThan as DateTime)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .dateCreation(isLessThanOrEqualTo as DateTime)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$CompteUtilisateurPerFieldToJson
                .dateCreation(isGreaterThan as DateTime)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .dateCreation(isGreaterThanOrEqualTo as DateTime)
            : null,
        whereIn: whereIn
            ?.map((e) => _$CompteUtilisateurPerFieldToJson.dateCreation(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$CompteUtilisateurPerFieldToJson.dateCreation(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery whereDateValiditer({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
    bool? isNull,
  }) {
    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CompteUtilisateurFieldMap['dateValiditer']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson
                .dateValiditer(isEqualTo as DateTime?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson
                .dateValiditer(isNotEqualTo as DateTime?)
            : null,
        isLessThan: isLessThan != null
            ? _$CompteUtilisateurPerFieldToJson
                .dateValiditer(isLessThan as DateTime?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .dateValiditer(isLessThanOrEqualTo as DateTime?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$CompteUtilisateurPerFieldToJson
                .dateValiditer(isGreaterThan as DateTime?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .dateValiditer(isGreaterThanOrEqualTo as DateTime?)
            : null,
        whereIn: whereIn
            ?.map((e) => _$CompteUtilisateurPerFieldToJson.dateValiditer(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$CompteUtilisateurPerFieldToJson.dateValiditer(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery whereHiboutikEmail({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CompteUtilisateurFieldMap['hiboutikEmail']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikEmail(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikEmail(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikEmail(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikEmail(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikEmail(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikEmail(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn
            ?.map((e) => _$CompteUtilisateurPerFieldToJson.hiboutikEmail(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$CompteUtilisateurPerFieldToJson.hiboutikEmail(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery whereHiboutikMotDePasse({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CompteUtilisateurFieldMap['hiboutikMotDePasse']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikMotDePasse(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikMotDePasse(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikMotDePasse(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikMotDePasse(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikMotDePasse(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikMotDePasse(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map(
            (e) => _$CompteUtilisateurPerFieldToJson.hiboutikMotDePasse(e)),
        whereNotIn: whereNotIn?.map(
            (e) => _$CompteUtilisateurPerFieldToJson.hiboutikMotDePasse(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery whereUrlHiboutik({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CompteUtilisateurFieldMap['urlHiboutik']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson.urlHiboutik(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson
                .urlHiboutik(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$CompteUtilisateurPerFieldToJson
                .urlHiboutik(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .urlHiboutik(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$CompteUtilisateurPerFieldToJson
                .urlHiboutik(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .urlHiboutik(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn
            ?.map((e) => _$CompteUtilisateurPerFieldToJson.urlHiboutik(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$CompteUtilisateurPerFieldToJson.urlHiboutik(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery whereHiboutikIdVendeur({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CompteUtilisateurFieldMap['hiboutikIdVendeur']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikIdVendeur(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikIdVendeur(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikIdVendeur(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikIdVendeur(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikIdVendeur(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikIdVendeur(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map(
            (e) => _$CompteUtilisateurPerFieldToJson.hiboutikIdVendeur(e)),
        whereNotIn: whereNotIn?.map(
            (e) => _$CompteUtilisateurPerFieldToJson.hiboutikIdVendeur(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery whereHiboutikWebHook({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CompteUtilisateurFieldMap['hiboutikWebHook']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikWebHook(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikWebHook(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikWebHook(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikWebHook(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikWebHook(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikWebHook(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn
            ?.map((e) => _$CompteUtilisateurPerFieldToJson.hiboutikWebHook(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$CompteUtilisateurPerFieldToJson.hiboutikWebHook(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery whereHiboutikWebHookCreationArticle({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CompteUtilisateurFieldMap['hiboutikWebHookCreationArticle']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikWebHookCreationArticle(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikWebHookCreationArticle(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikWebHookCreationArticle(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikWebHookCreationArticle(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$CompteUtilisateurPerFieldToJson
                .hiboutikWebHookCreationArticle(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson.hiboutikWebHookCreationArticle(
                isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$CompteUtilisateurPerFieldToJson
            .hiboutikWebHookCreationArticle(e)),
        whereNotIn: whereNotIn?.map((e) => _$CompteUtilisateurPerFieldToJson
            .hiboutikWebHookCreationArticle(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery whereUrlWix({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CompteUtilisateurFieldMap['urlWix']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson.urlWix(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson.urlWix(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$CompteUtilisateurPerFieldToJson.urlWix(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .urlWix(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$CompteUtilisateurPerFieldToJson.urlWix(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .urlWix(isGreaterThanOrEqualTo as String)
            : null,
        whereIn:
            whereIn?.map((e) => _$CompteUtilisateurPerFieldToJson.urlWix(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$CompteUtilisateurPerFieldToJson.urlWix(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery whereWixSiteId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CompteUtilisateurFieldMap['wixSiteId']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson.wixSiteId(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson
                .wixSiteId(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$CompteUtilisateurPerFieldToJson.wixSiteId(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .wixSiteId(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$CompteUtilisateurPerFieldToJson
                .wixSiteId(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .wixSiteId(isGreaterThanOrEqualTo as String)
            : null,
        whereIn:
            whereIn?.map((e) => _$CompteUtilisateurPerFieldToJson.wixSiteId(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$CompteUtilisateurPerFieldToJson.wixSiteId(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery whereWixApiKey({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CompteUtilisateurFieldMap['wixApiKey']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson.wixApiKey(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson
                .wixApiKey(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$CompteUtilisateurPerFieldToJson.wixApiKey(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .wixApiKey(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$CompteUtilisateurPerFieldToJson
                .wixApiKey(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .wixApiKey(isGreaterThanOrEqualTo as String)
            : null,
        whereIn:
            whereIn?.map((e) => _$CompteUtilisateurPerFieldToJson.wixApiKey(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$CompteUtilisateurPerFieldToJson.wixApiKey(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery whereWixWebHook({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CompteUtilisateurFieldMap['wixWebHook']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson.wixWebHook(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$CompteUtilisateurPerFieldToJson
                .wixWebHook(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$CompteUtilisateurPerFieldToJson.wixWebHook(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .wixWebHook(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$CompteUtilisateurPerFieldToJson
                .wixWebHook(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$CompteUtilisateurPerFieldToJson
                .wixWebHook(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn
            ?.map((e) => _$CompteUtilisateurPerFieldToJson.wixWebHook(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$CompteUtilisateurPerFieldToJson.wixWebHook(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery orderByEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$CompteUtilisateurFieldMap['email']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery orderByDateCreation({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CompteUtilisateurFieldMap['dateCreation']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery orderByDateValiditer({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CompteUtilisateurFieldMap['dateValiditer']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery orderByHiboutikEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CompteUtilisateurFieldMap['hiboutikEmail']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery orderByHiboutikMotDePasse({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CompteUtilisateurFieldMap['hiboutikMotDePasse']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery orderByUrlHiboutik({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CompteUtilisateurFieldMap['urlHiboutik']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery orderByHiboutikIdVendeur({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CompteUtilisateurFieldMap['hiboutikIdVendeur']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery orderByHiboutikWebHook({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CompteUtilisateurFieldMap['hiboutikWebHook']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery orderByHiboutikWebHookCreationArticle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CompteUtilisateurFieldMap['hiboutikWebHookCreationArticle']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery orderByUrlWix({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CompteUtilisateurFieldMap['urlWix']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery orderByWixSiteId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CompteUtilisateurFieldMap['wixSiteId']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery orderByWixApiKey({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CompteUtilisateurFieldMap['wixApiKey']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  CompteUtilisateurQuery orderByWixWebHook({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CompteUtilisateurDocumentSnapshot? startAtDocument,
    CompteUtilisateurDocumentSnapshot? endAtDocument,
    CompteUtilisateurDocumentSnapshot? endBeforeDocument,
    CompteUtilisateurDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CompteUtilisateurFieldMap['wixWebHook']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CompteUtilisateurQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$CompteUtilisateurQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class CompteUtilisateurDocumentSnapshot
    extends FirestoreDocumentSnapshot<CompteUtilisateur> {
  CompteUtilisateurDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<CompteUtilisateur> snapshot;

  @override
  CompteUtilisateurDocumentReference get reference {
    return CompteUtilisateurDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final CompteUtilisateur? data;
}

class CompteUtilisateurQuerySnapshot extends FirestoreQuerySnapshot<
    CompteUtilisateur, CompteUtilisateurQueryDocumentSnapshot> {
  CompteUtilisateurQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory CompteUtilisateurQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<CompteUtilisateur> snapshot,
  ) {
    final docs =
        snapshot.docs.map(CompteUtilisateurQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        CompteUtilisateurDocumentSnapshot._,
      );
    }).toList();

    return CompteUtilisateurQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<CompteUtilisateurDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    CompteUtilisateurDocumentSnapshot Function(DocumentSnapshot<T> doc)
        decodeDoc,
  ) {
    return FirestoreDocumentChange<CompteUtilisateurDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<CompteUtilisateur> snapshot;

  @override
  final List<CompteUtilisateurQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<CompteUtilisateurDocumentSnapshot>>
      docChanges;
}

class CompteUtilisateurQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<CompteUtilisateur>
    implements CompteUtilisateurDocumentSnapshot {
  CompteUtilisateurQueryDocumentSnapshot._(this.snapshot)
      : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<CompteUtilisateur> snapshot;

  @override
  final CompteUtilisateur data;

  @override
  CompteUtilisateurDocumentReference get reference {
    return CompteUtilisateurDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompteUtilisateur _$CompteUtilisateurFromJson(Map<String, dynamic> json) =>
    CompteUtilisateur(
      idCompte: json['idCompte'] as String,
      email: json['email'] as String,
      dateCreation: const FirestoreDateTimeConverter()
          .fromJson(json['dateCreation'] as Timestamp),
      dateValiditer: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['dateValiditer'], const FirestoreDateTimeConverter().fromJson),
      hiboutikEmail: json['hiboutikEmail'] as String? ?? '',
      hiboutikMotDePasse: json['hiboutikMotDePasse'] as String? ?? '',
      urlHiboutik: json['urlHiboutik'] as String? ?? '',
      hiboutikIdVendeur: json['hiboutikIdVendeur'] as String? ?? '',
      hiboutikWebHook: json['hiboutikWebHook'] as String? ?? '',
      urlWix: json['urlWix'] as String? ?? '',
      wixSiteId: json['wixSiteId'] as String? ?? '',
      wixApiKey: json['wixApiKey'] as String? ?? '',
      wixWebHook: json['wixWebHook'] as String? ?? '',
      hiboutikWebHookCreationArticle:
          json['hiboutikWebHookCreationArticle'] as String? ?? '',
    );

const _$CompteUtilisateurFieldMap = <String, String>{
  'idCompte': 'idCompte',
  'email': 'email',
  'dateCreation': 'dateCreation',
  'dateValiditer': 'dateValiditer',
  'hiboutikEmail': 'hiboutikEmail',
  'hiboutikMotDePasse': 'hiboutikMotDePasse',
  'urlHiboutik': 'urlHiboutik',
  'hiboutikIdVendeur': 'hiboutikIdVendeur',
  'hiboutikWebHook': 'hiboutikWebHook',
  'hiboutikWebHookCreationArticle': 'hiboutikWebHookCreationArticle',
  'urlWix': 'urlWix',
  'wixSiteId': 'wixSiteId',
  'wixApiKey': 'wixApiKey',
  'wixWebHook': 'wixWebHook',
};

// ignore: unused_element
abstract class _$CompteUtilisateurPerFieldToJson {
  // ignore: unused_element
  static Object? idCompte(String instance) => instance;
  // ignore: unused_element
  static Object? email(String instance) => instance;
  // ignore: unused_element
  static Object? dateCreation(DateTime instance) =>
      const FirestoreDateTimeConverter().toJson(instance);
  // ignore: unused_element
  static Object? dateValiditer(DateTime? instance) =>
      _$JsonConverterToJson<Timestamp, DateTime>(
          instance, const FirestoreDateTimeConverter().toJson);
  // ignore: unused_element
  static Object? hiboutikEmail(String instance) => instance;
  // ignore: unused_element
  static Object? hiboutikMotDePasse(String instance) => instance;
  // ignore: unused_element
  static Object? urlHiboutik(String instance) => instance;
  // ignore: unused_element
  static Object? hiboutikIdVendeur(String instance) => instance;
  // ignore: unused_element
  static Object? hiboutikWebHook(String instance) => instance;
  // ignore: unused_element
  static Object? hiboutikWebHookCreationArticle(String instance) => instance;
  // ignore: unused_element
  static Object? urlWix(String instance) => instance;
  // ignore: unused_element
  static Object? wixSiteId(String instance) => instance;
  // ignore: unused_element
  static Object? wixApiKey(String instance) => instance;
  // ignore: unused_element
  static Object? wixWebHook(String instance) => instance;
}

Map<String, dynamic> _$CompteUtilisateurToJson(CompteUtilisateur instance) =>
    <String, dynamic>{
      'idCompte': instance.idCompte,
      'email': instance.email,
      'dateCreation':
          const FirestoreDateTimeConverter().toJson(instance.dateCreation),
      'dateValiditer': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.dateValiditer, const FirestoreDateTimeConverter().toJson),
      'hiboutikEmail': instance.hiboutikEmail,
      'hiboutikMotDePasse': instance.hiboutikMotDePasse,
      'urlHiboutik': instance.urlHiboutik,
      'hiboutikIdVendeur': instance.hiboutikIdVendeur,
      'hiboutikWebHook': instance.hiboutikWebHook,
      'hiboutikWebHookCreationArticle': instance.hiboutikWebHookCreationArticle,
      'urlWix': instance.urlWix,
      'wixSiteId': instance.wixSiteId,
      'wixApiKey': instance.wixApiKey,
      'wixWebHook': instance.wixWebHook,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
