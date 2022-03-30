import 'package:flutter/widgets.dart';

import 'generated/app_localizations.dart';
import 'generated/app_localizations_en.dart';

AppLocalizations getLocalizations(BuildContext context) {
  final localizations = AppLocalizations.of(context);
  if (localizations != null) return localizations;
  return AppLocalizationsEn();
}

AppLocalizations getLocaleLocalizations([Locale? locale]) {
  if (locale == null) return AppLocalizationsEn();

  final localeSupported = AppLocalizations.supportedLocales.contains(locale);

  if (!localeSupported) return AppLocalizationsEn();

  return lookupAppLocalizations(locale);
}
