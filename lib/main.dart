import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app.dart';
import 'core/bloc/bloc_observer.dart';
import 'core/network/hive/hive_service.dart';
import 'injection/app_injection_container.dart';

Future<void> main() => runMyApp();

Future<void> runMyApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Paint.enableDithering = true; // Enable dithering for better quality
  Bloc.observer = AppBlocObserver();
  await HiveService().init();

  setupDependencyInjection();
  runApp(
    const App(),
  );
}
