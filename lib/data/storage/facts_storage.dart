import 'package:hive_flutter/hive_flutter.dart';

import '../../models/facts.dart';
import '../../utils/hive_base_repository.dart';

class FactsStorage extends HiveBaseRepository<Fact> {
  @override
  String get valueLabel => 'factsLabel';

  Future<List<Fact>> getHistory() async {
    final Box<Fact> _box = await getBox();
    return _box.values.toList().reversed.toList();
  }

  Future<void> saveFact(Fact fact) async {
    final _box = await getBox();
    await _box.add(fact);
  }
}
