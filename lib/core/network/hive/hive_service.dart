import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  Future<void> init() async {
    /// The code `final appDocumentDirectory = await getApplicationDocumentsDirectory();` retrieves the
    /// directory where the application can store files specific to the current user.
    await Hive.initFlutter();
    // Open Hive Boxes
    await hiveOpen('settings');
    await hiveOpen('users');
    log('Boxes opened');
    //? await SomeHiveDataSource().init();
  }

  /// The function `hiveOpen` opens a Hive box with the given `boxName` and throws an error if it fails
  /// to open.
  ///
  /// Args:
  ///   boxName (String): The `boxName` parameter is a string that represents the name of the Hive box
  /// that you want to open.
  Future<void> hiveOpen(String boxName) async {
    await Hive.openBox(boxName).onError(
      (error, stackTrace) async {
        await Hive.openBox(boxName);
        throw 'Failed to open $boxName Box\nError: $error';
      },
    );
  }
}
