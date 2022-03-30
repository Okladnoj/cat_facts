


import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get catFactPageTitle => 'Random Cat Fact';

  @override
  String get errorCatFact => 'Error while loading a random fact about cats!';

  @override
  String get errorRoutPageTitle => 'Error page';

  @override
  String get errorRoutPageDescribe => 'Error while opening a page!';

  @override
  String get emptyHistory => 'No facts searched yet';

  @override
  String get errorHistory => 'Error on loading history';

  @override
  String get catFactHistoryPageTitle => 'Cat Fact History';

  @override
  String get anotherFactButton => 'Another fact!';

  @override
  String get noDateLabel => 'No Date';
}
