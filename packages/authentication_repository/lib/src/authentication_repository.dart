// ignore_for_file: comment_references, depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:cache/cache.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class ResetPasswordFailure implements Exception {
  /// {@macro reset_password_failure}
  const ResetPasswordFailure([
    this.message = "Une exception inconnue s'est produite.",
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/sendPasswordResetEmail.html
  factory ResetPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const ResetPasswordFailure(
          'Email address is not valid.',
        );
      case 'user-not-found':
        return const ResetPasswordFailure(
          'There is no user corresponding to the email address.',
        );
      default:
        return const ResetPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}

/// {@template sign_up_with_email_and_password_failure}
/// Thrown during the sign up process if a failure occurs.
/// {@endtemplate}
class SignUpWithEmailAndPasswordFailure implements Exception {
  /// {@macro sign_up_with_email_and_password_failure}
  const SignUpWithEmailAndPasswordFailure([
    this.message = '',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure(
          LocalizationsAuthenticationStatic.instance!.invalidEmail,
        );
      case 'user-disabled':
        return SignUpWithEmailAndPasswordFailure(
          LocalizationsAuthenticationStatic.instance!.userDisabled,
        );
      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFailure(
          LocalizationsAuthenticationStatic.instance!.emailAlreadyInUse,
        );
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailure(
          LocalizationsAuthenticationStatic.instance!.operationNotAllowed,
        );
      case 'weak-password':
        return SignUpWithEmailAndPasswordFailure(
          LocalizationsAuthenticationStatic.instance!.weakPassword,
        );
      default:
        return SignUpWithEmailAndPasswordFailure(
          LocalizationsAuthenticationStatic.instance!.unknownException,
        );
    }
  }

  /// The associated error message.
  final String message;
}

/// {@template log_in_with_email_and_password_failure}
/// Thrown during the login process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html
/// {@endtemplate}
class LogInWithEmailAndPasswordFailure implements Exception {
  /// {@macro log_in_with_email_and_password_failure}
  const LogInWithEmailAndPasswordFailure([
    this.message = '',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return LogInWithEmailAndPasswordFailure(
          LocalizationsAuthenticationStatic.instance!.invalidEmail,
        );
      case 'invalid-credential':
        return LogInWithEmailAndPasswordFailure(
          LocalizationsAuthenticationStatic.instance!.userNotFound,
        );
      case 'user-disabled':
        return LogInWithEmailAndPasswordFailure(
          LocalizationsAuthenticationStatic.instance!.userDisabled,
        );
      case 'user-not-found':
        return LogInWithEmailAndPasswordFailure(
          LocalizationsAuthenticationStatic.instance!.userNotFound,
        );
      case 'wrong-password':
        return LogInWithEmailAndPasswordFailure(
          LocalizationsAuthenticationStatic.instance!.wrongPassword,
        );
      default:
        return LogInWithEmailAndPasswordFailure(
          LocalizationsAuthenticationStatic.instance!.unknownException,
        );
    }
  }

  /// The associated error message.
  final String message;
}

class LogInAnonymouslyFailure implements Exception {
  /// {@macro log_in_anonymously_failure}
  const LogInAnonymouslyFailure([this.message = '']);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInAnonymouslyFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return LogInAnonymouslyFailure(
          LocalizationsAuthenticationStatic
              .instance!.accountExistsWithDifferentCredential,
        );
      case 'invalid-credential':
        return LogInAnonymouslyFailure(
          LocalizationsAuthenticationStatic.instance!.invalidCredential,
        );
      case 'operation-not-allowed':
        return LogInAnonymouslyFailure(
          LocalizationsAuthenticationStatic.instance!.userDisabled,
        );
      case 'user-disabled':
        return LogInAnonymouslyFailure(
          LocalizationsAuthenticationStatic.instance!.userDisabled,
        );
      case 'user-not-found':
        return LogInAnonymouslyFailure(
          LocalizationsAuthenticationStatic.instance!.userNotFound,
        );
      case 'wrong-password':
        return LogInAnonymouslyFailure(
          LocalizationsAuthenticationStatic.instance!.wrongPassword,
        );
      case 'invalid-verification-code':
        return LogInAnonymouslyFailure(
          LocalizationsAuthenticationStatic.instance!.invalidVerificationCode,
        );
      case 'invalid-verification-id':
        return LogInAnonymouslyFailure(
          LocalizationsAuthenticationStatic.instance!.invalidVerificationId,
        );
      default:
        return LogInAnonymouslyFailure(
          LocalizationsAuthenticationStatic.instance!.unknownException,
        );
    }
  }

  /// The associated error message.
  final String message;
}

class DeleteAccountFailure implements Exception {
  /// {@macro delete_account_failure}
  const DeleteAccountFailure([this.message = '']);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory DeleteAccountFailure.fromCode(String code) {
    switch (code) {
      case 'requires-recent-login':
        return DeleteAccountFailure(
          LocalizationsAuthenticationStatic.instance!.requiresRecentLogin,
        );
      default:
        return DeleteAccountFailure(
          LocalizationsAuthenticationStatic.instance!.unknownException,
        );
    }
  }

  /// The associated error message.
  final String message;
}

class UpdateEmailFailure implements Exception {
  /// {@macro update_email_failure}
  const UpdateEmailFailure([this.message = '']);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory UpdateEmailFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return UpdateEmailFailure(
          LocalizationsAuthenticationStatic.instance!.invalidEmail,
        );
      case 'email-already-in-use':
        return UpdateEmailFailure(
          LocalizationsAuthenticationStatic.instance!.emailAlreadyInUse,
        );
      case 'requires-recent-login':
        return UpdateEmailFailure(
          LocalizationsAuthenticationStatic.instance!.requiresRecentLogin,
        );
      default:
        return UpdateEmailFailure(
          LocalizationsAuthenticationStatic.instance!.unknownException,
        );
    }
  }

  /// The associated error message.
  final String message;
}

/// {@template log_in_with_google_failure}
/// Thrown during the sign in with google process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithCredential.html
/// {@endtemplate}
class LogInWithGoogleFailure implements Exception {
  /// {@macro log_in_with_google_failure}
  const LogInWithGoogleFailure([
    this.message = '',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return LogInWithGoogleFailure(
          LocalizationsAuthenticationStatic
              .instance!.accountExistsWithDifferentCredential,
        );
      case 'invalid-credential':
        return LogInWithGoogleFailure(
          LocalizationsAuthenticationStatic.instance!.invalidCredential,
        );
      case 'operation-not-allowed':
        return LogInWithGoogleFailure(
          LocalizationsAuthenticationStatic.instance!.operationNotAllowed,
        );
      case 'user-disabled':
        return LogInWithGoogleFailure(
          LocalizationsAuthenticationStatic.instance!.userDisabled,
        );
      case 'user-not-found':
        return LogInWithGoogleFailure(
          LocalizationsAuthenticationStatic.instance!.userNotFound,
        );
      case 'wrong-password':
        return LogInWithGoogleFailure(
          LocalizationsAuthenticationStatic.instance!.wrongPassword,
        );
      case 'invalid-verification-code':
        return LogInWithGoogleFailure(
          LocalizationsAuthenticationStatic.instance!.invalidVerificationCode,
        );
      case 'invalid-verification-id':
        return LogInWithGoogleFailure(
          LocalizationsAuthenticationStatic.instance!.invalidVerificationId,
        );
      default:
        return LogInWithGoogleFailure(
          LocalizationsAuthenticationStatic.instance!.unknownException,
        );
    }
  }

  /// The associated error message.
  final String message;
}

class ForgotPasswordFailure implements Exception {
  /// {@macro forgot_password_failure}
  const ForgotPasswordFailure([this.message = '']);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory ForgotPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return ForgotPasswordFailure(
          LocalizationsAuthenticationStatic.instance!.invalidEmail,
        );
      case 'missing-android-pkg-name':
        return ForgotPasswordFailure(
          LocalizationsAuthenticationStatic.instance!.missingAndroidPkgName,
        );
      case 'missing-continue-uri':
        return ForgotPasswordFailure(
          LocalizationsAuthenticationStatic.instance!.missingContinueUri,
        );
      case 'missing-ios-bundle-id':
        return ForgotPasswordFailure(
          LocalizationsAuthenticationStatic.instance!.missingIosBundleId,
        );
      case 'invalid-continue-uri':
        return ForgotPasswordFailure(
          LocalizationsAuthenticationStatic.instance!.invalidContinueUri,
        );
      case 'unauthorized-continue-uri':
        return ForgotPasswordFailure(
          LocalizationsAuthenticationStatic.instance!.unauthorizedContinueUri,
        );
      case 'user-not-found':
        return ForgotPasswordFailure(
          LocalizationsAuthenticationStatic.instance!.userNotFound,
        );

      default:
        return ForgotPasswordFailure(
          LocalizationsAuthenticationStatic.instance!.unknownException,
        );
    }
  }

  /// The associated error message.
  final String message;
}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {}

/// {@template authentication_repository}
/// Repository which manages user authentication.
/// {@endtemplate}
class AuthenticationRepository {
  /// {@macro authentication_repository}
  AuthenticationRepository({
    CacheClient? cache,
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _cache = cache ?? CacheClient(),
        _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ??
            GoogleSignIn(
              clientId:
                  '449103680970-asb3evf83k754fj10vbet23f7r0rt119.apps.googleusercontent.com',
            );

  final CacheClient _cache;
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  /// Whether or not the current environment is web
  /// Should only be overridden for testing purposes. Otherwise,
  /// defaults to [kIsWeb]
  @visibleForTesting
  bool isWeb = kIsWeb;

  /// User cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      _cache.write(key: userCacheKey, value: user);
      return user;
    });
  }

  Stream<User> get informationUser {
    return _firebaseAuth.userChanges().map((event) {
      final user = event == null ? User.empty : event.toUser;
      _cache.write(key: userCacheKey, value: user);
      return user;
    });
  }

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  User get currentUser {
    return _cache.read<User>(key: userCacheKey) ?? User.empty;
  }

  void reloadUser() {
    _firebaseAuth.currentUser?.reload();
  }

  /// Creates a new user with the provided [email] and [password].
  ///
  /// Throws a [SignUpWithEmailAndPasswordFailure] if an exception occurs.
  Future<firebase_auth.UserCredential> inscriptionEmailMotDePasse({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [LogInWithGoogleFailure] if an exception occurs.
  Future<firebase_auth.UserCredential> connexionAvecGoogle() async {
    try {
      late final firebase_auth.AuthCredential credential;
      late final firebase_auth.UserCredential userCredential;
      if (isWeb) {
        final googleProvider = firebase_auth.GoogleAuthProvider();
        userCredential = await _firebaseAuth.signInWithPopup(
          googleProvider,
        );
        credential = userCredential.credential!;
      } else {
        final googleUser = await _googleSignIn.signIn();
        final googleAuth = await googleUser!.authentication;

        credential = firebase_auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
      }

      return await _firebaseAuth.signInWithCredential(credential);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithGoogleFailure();
    }
  }

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<String> connexionAvecEmailEtMotDePasse({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result.user!.uid;
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (e) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  Future<firebase_auth.UserCredential> connexionAvecApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = firebase_auth.OAuthProvider('apple.com').credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    return _firebaseAuth.signInWithCredential(oauthCredential);
  }

  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<String> connexionAnonyme() async {
    try {
      await _firebaseAuth.signInAnonymously();

      return _firebaseAuth.currentUser!.uid;
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInAnonymouslyFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInAnonymouslyFailure();
    }
  }

  /// Updates the current user's email with the provided.
  Future<void> modifieNomUser(String name) async {
    await _firebaseAuth.currentUser!.updateDisplayName(name);
  }

  /// Updates the current user's email with the provided.
  Future<void> envoiEmailDeVerifieEtModifieEmail({
    required String email,
  }) async {
    try {
      await _firebaseAuth.currentUser!.verifyBeforeUpdateEmail(email);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw UpdateEmailFailure.fromCode(e.code);
    } catch (_) {
      throw const UpdateEmailFailure();
    }
  }

  Future<void> envoiEmailRecuperationMotDePasse({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw ForgotPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const ForgotPasswordFailure();
    }
  }

  Future<void> modifieMotDePasse({
    required String motDePasseActuel,
    required String nouveauMotDePasse,
  }) async {
    try {
      final credential = firebase_auth.EmailAuthProvider.credential(
        email: _firebaseAuth.currentUser!.email!,
        password: motDePasseActuel,
      );
      await _firebaseAuth.currentUser!.reauthenticateWithCredential(credential);
      await _firebaseAuth.currentUser!.updatePassword(nouveauMotDePasse);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    }
  }

  Future<void> supprimpeCompteConnecter() async {
    try {
      if (_firebaseAuth.currentUser != null) {
        await _firebaseAuth.currentUser!.delete();
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw DeleteAccountFailure.fromCode(e.code);
    } catch (_) {
      throw const DeleteAccountFailure();
    }
  }

  Future<void> changeEmailUtilisateur({
    required String initialEmail,
    required String password,
    required String newEmail,
  }) async {
    final credential = firebase_auth.EmailAuthProvider.credential(
      email: initialEmail,
      password: password,
    );
    await _firebaseAuth.currentUser!.verifyBeforeUpdateEmail(newEmail);
    await _firebaseAuth.currentUser!.reauthenticateWithCredential(credential);
    // ignore: deprecated_member_use
    await _firebaseAuth.currentUser!.updateEmail(newEmail);
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> deconnexion() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (_) {
      throw LogOutFailure();
    }
  }
}

class FakeAuthenticationRepository implements AuthenticationRepository {
  FakeAuthenticationRepository({
    required MockFirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  @override
  bool isWeb = false;

  @override
  final CacheClient _cache = CacheClient();

  @override
  final firebase_auth.FirebaseAuth _firebaseAuth;

  @override
  GoogleSignIn get _googleSignIn => throw UnimplementedError();

  @visibleForTesting
  static const userCacheKey = '__fake_user_cache_key__';

  User? userConnecter;
  List<User> listeUsers = [];

  bool erreur = false;

  @override
  User get currentUser {
    return userConnecter ??
        _firebaseAuth.currentUser?.toUser ??
        _cache.read<User>(key: userCacheKey) ??
        User.empty;
  }

  @override
  Future<void> deconnexion() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
      ]);
      userConnecter = null;
    } catch (_) {
      throw LogOutFailure();
    }
  }

  @override
  Stream<User> get user => _firebaseAuth.authStateChanges().map((firebaseUser) {
        final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
        _cache.write(key: userCacheKey, value: user);
        return user;
      });

  @override
  Future<void> supprimpeCompteConnecter() {
    listeUsers.removeWhere((element) => element.id == userConnecter!.id);
    userConnecter = null;

    return _firebaseAuth.currentUser!.delete();
  }

  @override
  Future<void> envoiEmailRecuperationMotDePasse({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw ResetPasswordFailure.fromCode(e.code);
    } catch (e) {
      throw const ResetPasswordFailure();
    }
  }

  @override
  Stream<User> get informationUser => _firebaseAuth.userChanges().map((event) {
        final user = event == null ? User.empty : event.toUser;
        _cache.write(key: userCacheKey, value: user);
        return user;
      });

  @override
  Future<String> connexionAnonyme() async {
    await _firebaseAuth.signInAnonymously();
    return _firebaseAuth.currentUser!.uid;
  }

  @override
  Future<String> connexionAvecEmailEtMotDePasse({
    required String email,
    required String password,
  }) async {
    try {
      userConnecter =
          listeUsers.firstWhere((element) => element.email == email);
      return userConnecter!.id;
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<firebase_auth.UserCredential> connexionAvecGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<firebase_auth.UserCredential> inscriptionEmailMotDePasse({
    required String email,
    required String password,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (erreur) {
        throw SignUpWithEmailAndPasswordFailure();
      }

      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      userConnecter = userCredential.user?.toUser.copyWith(
        id: 'uid' + (listeUsers.length + 1).toString(),
      );

      listeUsers.add(userConnecter!);
      return FakeUserCredential()
        ..userFake = MockUser(
          uid: userConnecter!.id,
          email: userConnecter!.email,
          phoneNumber: userConnecter!.phoneNumber,
          displayName: userConnecter!.name,
          isAnonymous: userConnecter!.isAnonymous ?? false,
          photoURL: userConnecter!.photo,
        );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<void> modifieNomUser(String name) {
    return _firebaseAuth.currentUser!.updateDisplayName(name);
  }

  @override
  Future<void> envoiEmailDeVerifieEtModifieEmail({required String email}) {
    return _firebaseAuth.currentUser!.verifyBeforeUpdateEmail(email);
  }

  @override
  String generateNonce([int length = 32]) {
    throw UnimplementedError();
  }

  @override
  String sha256ofString(String input) {
    throw UnimplementedError();
  }

  @override
  Future<firebase_auth.UserCredential> connexionAvecApple() {
    throw UnimplementedError();
  }

  @override
  Future<void> modifieMotDePasse({
    required String motDePasseActuel,
    required String nouveauMotDePasse,
  }) async {}

  Future<void> changeEmailUtilisateur({
    required String initialEmail,
    required String password,
    required String newEmail,
  }) async {
    final credential = firebase_auth.EmailAuthProvider.credential(
      email: initialEmail,
      password: password,
    );
    await _firebaseAuth.currentUser!.reauthenticateWithCredential(credential);

    // ignore: deprecated_member_use
    await _firebaseAuth.currentUser!.updateEmail(newEmail);
  }

  @override
  void reloadUser() {
    _firebaseAuth.currentUser?.reload();
  }
}

extension on firebase_auth.User {
  /// Maps a [firebase_auth.User] into a [User].
  User get toUser {
    return User(
      id: uid,
      email: email,
      name: displayName,
      photo: photoURL,
      isAnonymous: isAnonymous,
      creationTime: metadata.creationTime,
      lastSignInTime: metadata.lastSignInTime,
      emailVerified: emailVerified,
      phoneNumber: phoneNumber,
    );
  }
}

class FakeUserCredential implements firebase_auth.UserCredential {
  firebase_auth.User? userFake;

  @override
  firebase_auth.AdditionalUserInfo? get additionalUserInfo =>
      throw UnimplementedError();

  @override
  firebase_auth.AuthCredential? get credential => throw UnimplementedError();

  @override
  firebase_auth.User? get user => userFake;
}
