import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/api/api_constants.dart';
import '../../data/api/facts_api.dart';
import '../../data/storage/facts_storage.dart';
import '../../models/cat.dart';

part 'cat_fact_state.dart';

class CatFactCubit extends Cubit<CatFactState> {
  final FactsApi api;
  final FactsStorage storage;

  CatFactCubit({
    required this.api,
    required this.storage,
  }) : super(const CatFactState());

  Future<void> loadRandomFact() async {
    emit(state.copyWith(status: CatFactStatus.loading));
    try {
      const imageUrl = ApiConstants.catImage;
      final randomValue = Random().nextInt(9999);

      final cat = Cat(
        fact: await api.getFact(),
        imageUrl: '$imageUrl?arg=$randomValue',
      );
      await storage.saveFact(cat.fact);
      emit(state.copyWith(
        status: CatFactStatus.loaded,
        cat: cat,
      ));
    } catch (exception) {
      emit(state.copyWith(
        status: CatFactStatus.error,
        errorMessage: exception.toString(),
      ));
    }
  }
}
