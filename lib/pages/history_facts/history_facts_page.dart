import 'package:cat_facts/l10n/localization_helper.dart';
import 'package:cat_facts/models/facts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/facts_history/facts_history_cubit.dart';
import '../../views/app_loader.dart';
import '../../views/error_massage.dart';

class FactsHistoryPage extends StatelessWidget {
  static const id = 'FactsHistoryPage';

  const FactsHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getLocalizations(context).catFactHistoryPageTitle),
      ),
      body: BlocBuilder<FactsHistoryCubit, FactsHistoryLoaded>(
        builder: (context, state) {
          return Stack(
            children: [
              _buildContent(context, state),
              if (state.status == HistoryFactStatus.loading)
                const Center(
                  child: AppLoader(size: 48),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, FactsHistoryLoaded state) {
    final isError = state.status == HistoryFactStatus.error;

    if (isError) return _buildErrorHistory(context);

    if (state.factsHistory.isEmpty) return _buildEmptyHistory(context);

    return ListView(
      padding: const EdgeInsets.all(12),
      physics: const BouncingScrollPhysics(),
      children: state.factsHistory
          .map((catFact) => _buildDescription(catFact))
          .toList(),
    );
  }

  Widget _buildErrorHistory(BuildContext context) {
    final massage = getLocalizations(context).errorHistory;
    return ErrorMassage(massage: massage);
  }

  Widget _buildEmptyHistory(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.maxFinite,
      child: Center(
        child: Text(getLocalizations(context).emptyHistory),
      ),
    );
  }

  Widget _buildDescription(Fact fact) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          _buildDescriptionDate(fact),
          const SizedBox(width: 10),
          _buildDescriptionValue(fact),
        ],
      ),
    );
  }

  Widget _buildDescriptionDate(Fact fact) {
    return Row(
      children: [
        Text(
          fact.formattedDate,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionValue(Fact fact) {
    return Row(
      children: [
        Expanded(
          child: Text(
            fact.description,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
