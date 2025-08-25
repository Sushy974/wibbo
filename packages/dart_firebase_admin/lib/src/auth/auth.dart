part of '../auth.dart';

/// Auth service bound to the provided app.
/// An Auth instance can have multiple tenants.
class Auth extends _BaseAuth {
  Auth(FirebaseAdminApp app)
      : super(
          app: app,
          authRequestHandler: _AuthRequestHandler(app),
        );

  // TODO tenantManager
  // TODO projectConfigManager
}

class FakeAuth implements Auth {
  FakeAuth(this._app);

  final FirebaseAdminApp _app;

  final Map<String, UserRecord> _fakeUsers = {};
  final Map<String, Map<String, Object?>> _customClaims = {};

  @override
  FirebaseAdminApp get app => _app;

  bool get supportsTenantId => false;

  @override
  FirebaseTokenVerifier get _idTokenVerifier => throw UnimplementedError();
  @override
  FirebaseTokenVerifier get _sessionCookieVerifier =>
      throw UnimplementedError();
  @override
  _AbstractAuthRequestHandler get _authRequestHandler =>
      throw UnimplementedError();
  @override
  _FirebaseTokenGenerator get _tokenGenerator => throw UnimplementedError();
  @override
  Future<DecodedIdToken> _verifyDecodedJWTNotRevokedOrDisabled(
      DecodedIdToken decodedIdToken, AuthClientErrorCode revocationErrorInfo) {
    _todo();
  }

  @override
  Future<UserRecord> createUser(CreateRequest properties) async {
    _todo();
  }

  Future<void> initialiseCollection(List<UserRecord> users) async {
    for (var user in users) {
      _fakeUsers[user.uid] = user;
    }
  }

  @override
  Future<UserRecord> getUser(String uid) async {
    final user = _fakeUsers[uid];
    if (user == null)
      throw FirebaseAuthAdminException.fromServerError(
        serverErrorCode: 'user-not-found',
      );
    return user;
  }

  @override
  Future<UserRecord> getUserByEmail(String email) async {
    _todo();
  }

  @override
  Future<void> deleteUser(String uid) async {
    _fakeUsers.remove(uid);
    _customClaims.remove(uid);
  }

  @override
  Future<UserRecord> updateUser(String uid, UpdateRequest properties) async {
    final old = await getUser(uid);
    final updated = UserRecord(
      uid: uid,
      email: properties.email ?? old.email,
      emailVerified: properties.emailVerified ?? old.emailVerified,
      displayName: properties.displayName?.toString() ?? old.displayName,
      phoneNumber: properties.phoneNumber?.toString() ?? old.phoneNumber,
      disabled: properties.disabled ?? old.disabled,
      metadata: old.metadata,
      customClaims: _customClaims[uid] ?? {},
      providerData: [],
      multiFactor: old.multiFactor,
      photoUrl: properties.photoURL?.value ?? old.photoUrl,
      passwordHash: properties.password ?? old.passwordHash,
      passwordSalt: old.passwordSalt,
      tenantId: old.tenantId,
      tokensValidAfterTime: old.tokensValidAfterTime,
    );
    _fakeUsers[uid] = updated;
    return updated;
  }

  @override
  Future<void> setCustomUserClaims(String uid,
      {Map<String, Object?>? customUserClaims}) async {
    _todo();
  }

  // Méthodes restantes renvoyant une erreur contrôlée
  @override
  Future<AuthProviderConfig> createProviderConfig(AuthProviderConfig config) =>
      _todo();
  @override
  Future<String> createCustomToken(String uid,
          {Map<String, Object?>? developerClaims}) =>
      _todo();
  @override
  Future<String> createSessionCookie(String idToken,
          {required int expiresIn}) =>
      _todo();
  @override
  Future<void> deleteProviderConfig(String providerId) => _todo();
  @override
  Future<DeleteUsersResult> deleteUsers(List<String> uids) => _todo();
  @override
  Future<String> generateEmailVerificationLink(String email,
          {ActionCodeSettings? actionCodeSettings}) =>
      _todo();
  @override
  Future<String> generatePasswordResetLink(String email,
          {ActionCodeSettings? actionCodeSettings}) =>
      _todo();
  @override
  Future<String> generateSignInWithEmailLink(
          String email, ActionCodeSettings actionCodeSettings) =>
      _todo();
  @override
  Future<String> generateVerifyAndChangeEmailLink(String email, String newEmail,
          {ActionCodeSettings? actionCodeSettings}) =>
      _todo();
  @override
  Future<AuthProviderConfig> getProviderConfig(String providerId) => _todo();
  @override
  Future<UserRecord> getUserByPhoneNumber(String phoneNumber) => _todo();
  @override
  Future<UserRecord> getUserByProviderUid(
          {required String providerId, required String uid}) =>
      _todo();
  @override
  Future<GetUsersResult> getUsers(List<UserIdentifier> identifiers) => _todo();
  @override
  Future<UserImportResult> importUsers(List<UserImportRecord> users,
          [UserImportOptions? options]) =>
      _todo();
  @override
  Future<ListProviderConfigResults> listProviderConfigs(
          AuthProviderConfigFilter options) =>
      _todo();
  @override
  Future<ListUsersResult> listUsers({int? maxResults, String? pageToken}) =>
      _todo();
  @override
  Future<void> revokeRefreshTokens(String uid) => _todo();
  @override
  Future<AuthProviderConfig> updateProviderConfig(
          String providerId, UpdateAuthProviderRequest updatedConfig) =>
      _todo();
  @override
  Future<DecodedIdToken> verifyIdToken(String idToken,
          {bool checkRevoked = false}) =>
      _todo();
  @override
  Future<DecodedIdToken> verifySessionCookie(String sessionCookie,
          {bool checkRevoked = false}) =>
      _todo();

  Never _todo() =>
      throw UnimplementedError('FakeAuth: méthode non implémentée');
}
