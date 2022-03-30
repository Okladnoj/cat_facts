import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'utils/database_manager.dart';

void main() async {
  await HiveManager.initDB();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const App());
}
