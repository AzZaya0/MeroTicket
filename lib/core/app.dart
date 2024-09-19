import 'package:flutter/material.dart';

import '../config/router/routers.dart';
import '../config/themes/app_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Template", // App name
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appLightTheme(),
      darkTheme: AppTheme.appDarkTheme(),
      themeMode: ThemeMode.system,
      routes: AppRoutes.routes, // Routes
    );
  }
}
