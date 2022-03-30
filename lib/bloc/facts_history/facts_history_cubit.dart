import 'package:bloc/bloc.dart';
import 'package:cat_facts/models/facts.dart';
import 'package:equatable/equatable.dart';

import '../../../data/storage/facts_storage.dart';

part 'facts_history_state.dart';

class FactsHistoryCubit extends Cubit<FactsHistoryLoaded> {
  final FactsStorage storage;

  FactsHistoryCubit({
    required this.storage,
  }) : super(const FactsHistoryLoaded());

  Future<void> loadHistory() async {
    emit(state.copyWith(status: HistoryFactStatus.loading));
    try {
      emit(state.copyWith(
        factsHistory: await storage.getHistory(),
        status: HistoryFactStatus.loaded,
      ));
    } catch (exception) {
      emit(state.copyWith(
        status: HistoryFactStatus.error,
        errorMessage: exception.toString(),
      ));
    }
  }
}
