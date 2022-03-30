import 'package:hive/hive.dart';

abstract class HiveBaseRepository<T> {
  String get boxName => T.runtimeType.toString().toLowerCase();

  String get valueLabel;

  Box<T>? _box;

  Future<void> _initBox() async {
    _box = await Hive.openBox(boxName);
  }

  Future<Box<T>> getBox() async {
    final boxOpened = _box?.isOpen ?? false;
    if (!boxOpened) await _initBox();
    return _box!;
  }
}
