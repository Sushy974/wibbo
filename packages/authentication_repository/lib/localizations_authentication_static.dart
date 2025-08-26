// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LocalizationsAuthenticationStatic {
  factory LocalizationsAuthenticationStatic.of(BuildContext context) {
    final locale = Localizations.localeOf(context);
    instance ??= LocalizationsAuthenticationStatic._(locale: locale);
    return instance ?? LocalizationsAuthenticationStatic._();
  }
  LocalizationsAuthenticationStatic._({this.locale = const Locale('en')});
  final Locale locale;
  static LocalizationsAuthenticationStatic? instance;
  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'invalid-email': 'Email is not valid or badly formatted.',
      'user-disabled':
          'This user has been disabled. Please contact support for help.',
      'email-already-in-use': 'An account already exists for that email.',
      'operation-not-allowed':
          'Operation is not allowed.  Please contact support.',
      'weak-password': 'Please enter a stronger password',
      'user-not-found': 'Email is not found, please create an account.',
      'wrong-password': 'Incorrect password, please try again.',
      'account-exists-with-different-credential':
          'Account exists with different credentials.',
      'invalid-credential':
          'The credential received is malformed or has expired.',
      'invalid-verification-code':
          'The credential verification code received is invalid.',
      'invalid-verification-id':
          'The credential verification ID received is invalid.',
      'unknown-exception': 'An unknown exception occurred.',
      'missing-android-pkg-name':
          'An Android package name must be provided if the Android app is required to be installed.',
      'missing-continue-uri': 'A continue URL must be provided in the request.',
      'missing-ios-bundle-id':
          'An iOS Bundle ID must be provided if an App Store ID is provided.',
      'invalid-continue-uri':
          'The continue URL provided in the request is invalid.',
      'unauthorized-continue-uri':
          'The domain of the continue URL is not whitelisted.  Please whitelist the domain in the Firebase console.',
      'requires-recent-login':
          'This operation is sensitive and requires recent authentication. Log in again before retrying this request.',
    },
    'fr': {
      'invalid-email': "L'email n'est pas valide ou mal formaté.",
      'user-disabled': 'Cet utilisateur a été désactivé. '
          "Veuillez contacter le support pour obtenir de l'aide",
      'email-already-in-use': 'Un compte existe déjà pour cet e-mail.',
      'operation-not-allowed': "L'opération n'est pas autorisée. "
          'Veuillez contacter le support.',
      'weak-password': 'Veuillez saisir un mot de passe plus fort.',
      'user-not-found': 'Aucun compte trouvé, veuillez créer un compte.',
      'wrong-password': 'Mot de passe incorrect, veuillez réessayer.',
      'account-exists-with-different-credential':
          "Un compte existe avec des informations d'identification différentes.",
      'invalid-credential':
          "Les informations d'identification reçues sont mal formées ou ont expiré.",
      'invalid-verification-code':
          "Le code de vérification des informations d'identification reçu n'est pas valide.",
      'invalid-verification-id':
          "L'ID de vérification des informations d'identification reçu n'est pas valide.",
      'unknown-exception': "Une exception inconnue s'est produite.",
      'missing-android-pkg-name': 'Un nom de package Android doit être fourni '
          "si l'application Android est requise pour authentifier un utilisateur.",
      'missing-continue-uri':
          'Une URL de continuation doit être fournie dans la requête.',
      'missing-ios-bundle-id':
          'Un identifiant de bundle iOS doit être fourni si un identifiant App Store est fourni.',
      'invalid-continue-uri':
          "L'URL de continuation fournie dans la requête n'est pas valide.",
      'unauthorized-continue-uri':
          "Le domaine de l'URL de continuation n'est pas sur liste blanche. "
              'Veuillez mettre le domaine sur liste blanche dans la console Firebase.',
      'requires-recent-login': "L'utilisateur doit s'authentifier à nouveau "
          'avant de pouvoir effectuer cette opération.',
    },
  };

  static List<String> languages() => _localizedValues.keys.toList();

  String get invalidEmail {
    return _localizedValues[locale.languageCode]!['invalid-email']!;
  }

  String get userDisabled {
    return _localizedValues[locale.languageCode]!['user-disabled']!;
  }

  String get emailAlreadyInUse {
    return _localizedValues[locale.languageCode]!['email-already-in-use']!;
  }

  String get operationNotAllowed {
    return _localizedValues[locale.languageCode]!['operation-not-allowed']!;
  }

  String get weakPassword {
    return _localizedValues[locale.languageCode]!['weak-password']!;
  }

  String get userNotFound {
    return _localizedValues[locale.languageCode]!['user-not-found']!;
  }

  String get wrongPassword {
    return _localizedValues[locale.languageCode]!['wrong-password']!;
  }

  String get accountExistsWithDifferentCredential {
    return _localizedValues[locale.languageCode]![
        'account-exists-with-different-credential']!;
  }

  String get invalidCredential {
    return _localizedValues[locale.languageCode]!['invalid-credential']!;
  }

  String get invalidVerificationCode {
    return _localizedValues[locale.languageCode]!['invalid-verification-code']!;
  }

  String get invalidVerificationId {
    return _localizedValues[locale.languageCode]!['invalid-verification-id']!;
  }

  String get unknownException {
    return _localizedValues[locale.languageCode]!['unknown-exception']!;
  }

  String get missingAndroidPkgName {
    return _localizedValues[locale.languageCode]!['missing-android-pkg-name']!;
  }

  String get missingContinueUri {
    return _localizedValues[locale.languageCode]!['missing-continue-uri']!;
  }

  String get missingIosBundleId {
    return _localizedValues[locale.languageCode]!['missing-ios-bundle-id']!;
  }

  String get invalidContinueUri {
    return _localizedValues[locale.languageCode]!['invalid-continue-uri']!;
  }

  String get unauthorizedContinueUri {
    return _localizedValues[locale.languageCode]!['unauthorized-continue-uri']!;
  }

  String get requiresRecentLogin {
    return _localizedValues[locale.languageCode]!['requires-recent-login']!;
  }
}

class LocalizationsAuthenticationStaticDelegate
    extends LocalizationsDelegate<LocalizationsAuthenticationStatic> {
  const LocalizationsAuthenticationStaticDelegate();

  @override
  bool isSupported(Locale locale) =>
      LocalizationsAuthenticationStatic.languages()
          .contains(locale.languageCode);

  @override
  Future<LocalizationsAuthenticationStatic> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<LocalizationsAuthenticationStatic>(
      LocalizationsAuthenticationStatic._(locale: locale),
    );
  }

  @override
  bool shouldReload(LocalizationsAuthenticationStaticDelegate old) => false;
}
