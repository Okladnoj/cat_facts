import 'package:cat_facts/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'pages/cat_fact/cat_fact_page.dart';
import 'routers/rout_generator.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: ThemeData.light().iconTheme,
          titleTextStyle: Theme.of(context).textTheme.headline6,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        primarySwatch: Colors.teal,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('en'),
      supportedLocales: const [Locale('en')],
      onGenerateRoute: RoutGenerator.onGenerate,
      initialRoute: CatFactPage.id,
    );
  }
}
