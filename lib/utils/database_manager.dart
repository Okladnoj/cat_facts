import 'package:hive_flutter/hive_flutter.dart';

import '../models/cat.dart';
import '../models/facts.dart';

class HiveManager {
  static const catId = 0;
  static const factId = 1;

  static Future<void> initDB() async {
    await Hive.initFlutter();
    _registerAdapters();
  }

  static void _registerAdapters() {
    Hive.registerAdapter(CatAdapter());
    Hive.registerAdapter(FactAdapter());
  }
}
