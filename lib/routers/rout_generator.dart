import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cat_fact/cat_fact_cubit.dart';
import '../bloc/facts_history/facts_history_cubit.dart';
import '../data/api/facts_api.dart';
import '../data/storage/facts_storage.dart';
import '../pages/cat_fact/cat_fact_page.dart';
import '../pages/errors/error_rout_page.dart';
import '../pages/history_facts/history_facts_page.dart';

class RoutGenerator {
  static Route<dynamic> onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case CatFactPage.id:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) {
                return CatFactCubit(
                  api: FactsApi(FactsApi.getDio()),
                  storage: FactsStorage(),
                )..loadRandomFact();
              },
              child: const CatFactPage(),
            );
          },
          settings: settings,
        );

      case FactsHistoryPage.id:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) {
                return FactsHistoryCubit(storage: FactsStorage())
                  ..loadHistory();
              },
              child: const FactsHistoryPage(),
            );
          },
          settings: settings,
        );

      default:
        return MaterialPageRoute(builder: (context) => const ErrorRoutePage());
    }
  }
}
