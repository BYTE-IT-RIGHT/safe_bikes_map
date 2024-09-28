import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AppLocalizations T(BuildContext context) => AppLocalizations.of(context)!;

class L10n {
  static final supported = [
    const Locale('en'),
    const Locale('pl'),
  ];

  static List<LocalizationsDelegate<dynamic>> get localizationDelegates => [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  static String getNativeLangName(String langCode) {
    switch (langCode) {
      case 'en':
        return 'English';
      case 'pl':
        return 'Polski';
      default:
        return 'English';
    }
  }
}
