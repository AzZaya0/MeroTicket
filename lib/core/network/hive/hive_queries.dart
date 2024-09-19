import 'package:hive_flutter/hive_flutter.dart';

class HiveQueries {
  Future<void> setValue({
    required String boxName,
    required String key,
    required dynamic value,
  }) async {
    await Hive.box(boxName).put(key, value);
  }

  Future<dynamic> getValue({
    required String boxName,
    required String key,
    required dynamic defaultValue,
  }) async {
    return Hive.box(boxName).get(key, defaultValue: defaultValue);
  }

  Future<void> deleteValue({
    required String boxName,
    required String key,
  }) async {
    await Hive.box(boxName).delete(key);
  }

  Future<void> deleteBox({
    required String boxName,
  }) async {
    await Hive.deleteBoxFromDisk(boxName);
  }

  Future<void> deleteAll() async {
    await Hive.deleteFromDisk();
  }

  Future<void> clearBox({
    required String boxName,
  }) async {
    await Hive.box(boxName).clear();
  }
}
