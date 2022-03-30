// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:cat_facts/l10n/localization_helper.dart';
import 'package:cat_facts/pages/errors/error_rout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  testWidgets('Error Page Test', (WidgetTester tester) async {
    final systemLanguage = Platform.localeName;
    final systemLocale = Locale(systemLanguage);

    await tester.pumpWidget(
      const MaterialApp(
        home: ErrorRoutePage(),
      ),
    );

    await tester.pump(const Duration(seconds: 2));

    expect(
      find.text(getLocaleLocalizations(systemLocale).errorRoutPageTitle),
      findsOneWidget,
    );
    expect(
      find.text(getLocaleLocalizations(systemLocale).errorRoutPageDescribe),
      findsOneWidget,
    );
    expect(
      find.text(getLocaleLocalizations(systemLocale).catFactPageTitle),
      findsNothing,
    );
    expect(
      find.text(getLocaleLocalizations(systemLocale).anotherFactButton),
      findsNothing,
    );
    expect(
      find.text(getLocaleLocalizations(systemLocale).catFactHistoryPageTitle),
      findsNothing,
    );
  });
}
