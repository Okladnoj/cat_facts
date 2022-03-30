import 'package:cat_facts/l10n/localization_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cat_fact/cat_fact_cubit.dart';
import '../../utils/image_view_utils.dart';
import '../../views/error_massage.dart';
import '../history_facts/history_facts_page.dart';

class CatFactPage extends StatelessWidget {
  static const id = 'CatFactPage';

  const CatFactPage({Key? key}) : super(key: key);

  Future<void> _openHistory(BuildContext context) async {
    await Navigator.pushNamed(context, FactsHistoryPage.id);
  }

  List<Widget> _getAppBarActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 16),
        child: IconButton(
          onPressed: () => _openHistory(context),
          icon: const Icon(Icons.history),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getLocalizations(context).catFactPageTitle),
        actions: _getAppBarActions(context),
      ),
      body: BlocBuilder<CatFactCubit, CatFactState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: _buildContent(context, state),
              ),
              _buildAnotherFactButton(context, state),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    CatFactState state,
  ) {
    if (state.status == CatFactStatus.error) return _buildErrorCatFact(context);
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: _buildCatImage(context, state)),
            _buildDescription(state),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorCatFact(BuildContext context) {
    final massage = getLocalizations(context).errorCatFact;
    return ErrorMassage(massage: massage);
  }

  Widget _buildCatImage(
    BuildContext context,
    CatFactState state,
  ) {
    final cat = state.cat;

    if (cat == null) return const SizedBox.shrink();

    final imageUrl = cat.imageUrl;
    final size = MediaQuery.of(context).size.width * 0.75;

    return ClipRRect(
      borderRadius: BorderRadius.circular(size),
      child: Image.network(
        imageUrl,
        key: ValueKey(imageUrl),
        width: size,
        height: size,
        fit: BoxFit.cover,
        frameBuilder: imageFrameBuilder,
      ),
    );
  }

  Widget _buildDescription(CatFactState state) {
    final cat = state.cat;

    if (cat == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cat.fact.formattedDate,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            cat.fact.description,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnotherFactButton(
    BuildContext context,
    CatFactState state,
  ) {
    final loading = state.status == CatFactStatus.loading;
    final buttonTextWidget = Text(
      getLocalizations(context).anotherFactButton.toUpperCase(),
      style: const TextStyle(
        letterSpacing: 1.5,
      ),
    );
    final loaderWidget = SizedBox(
      width: 28,
      height: 28,
      child: CircularProgressIndicator(
        color: Theme.of(context).dividerColor,
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          maximumSize: const Size.fromHeight(50),
        ),
        onPressed: loading ? null : context.read<CatFactCubit>().loadRandomFact,
        child: loading ? loaderWidget : buttonTextWidget,
      ),
    );
  }
}
