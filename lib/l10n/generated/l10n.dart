// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get auth_email {
    return Intl.message(
      'E-mail',
      name: 'auth_email',
      desc: '',
      args: [],
    );
  }

  /// `Welcome in FindBET!`
  String get auth_welcome {
    return Intl.message(
      'Welcome in FindBET!',
      name: 'auth_welcome',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get auth_login {
    return Intl.message(
      'Log in',
      name: 'auth_login',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get auth_sign_in {
    return Intl.message(
      'Sign in',
      name: 'auth_sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get auth_username {
    return Intl.message(
      'Username',
      name: 'auth_username',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get auth_password {
    return Intl.message(
      'Password',
      name: 'auth_password',
      desc: '',
      args: [],
    );
  }

  /// `Don't you remember the password?`
  String get auth_cant_rmbr_pwd {
    return Intl.message(
      'Don\'t you remember the password?',
      name: 'auth_cant_rmbr_pwd',
      desc: '',
      args: [],
    );
  }

  /// `Repeat password`
  String get auth_repeat_password {
    return Intl.message(
      'Repeat password',
      name: 'auth_repeat_password',
      desc: '',
      args: [],
    );
  }

  /// `Add photo`
  String get auth_add_photo {
    return Intl.message(
      'Add photo',
      name: 'auth_add_photo',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get auth_phone_number {
    return Intl.message(
      'Phone number',
      name: 'auth_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a real number because the code needed to verify your account in the next step will be sent to it.`
  String get auth_phone_info {
    return Intl.message(
      'Please enter a real number because the code needed to verify your account in the next step will be sent to it.',
      name: 'auth_phone_info',
      desc: '',
      args: [],
    );
  }

  /// `Enter a 6-digit PIN`
  String get auth_pin {
    return Intl.message(
      'Enter a 6-digit PIN',
      name: 'auth_pin',
      desc: '',
      args: [],
    );
  }

  /// `It should have already reached you via SMS.`
  String get auth_pin_info {
    return Intl.message(
      'It should have already reached you via SMS.',
      name: 'auth_pin_info',
      desc: '',
      args: [],
    );
  }

  /// `By logging in, you accept the current`
  String get auth_consent {
    return Intl.message(
      'By logging in, you accept the current',
      name: 'auth_consent',
      desc: '',
      args: [],
    );
  }

  /// `By signing in, you accept the current`
  String get auth_sign_in_consent {
    return Intl.message(
      'By signing in, you accept the current',
      name: 'auth_sign_in_consent',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get auth_terms_of_service {
    return Intl.message(
      'Terms of Service',
      name: 'auth_terms_of_service',
      desc: '',
      args: [],
    );
  }

  /// `I certify that I am over 18 years old.`
  String get auth_over_18_consent {
    return Intl.message(
      'I certify that I am over 18 years old.',
      name: 'auth_over_18_consent',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pl'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
