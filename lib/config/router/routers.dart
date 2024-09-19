import 'package:flutter/material.dart';

import '../../feature/splash/presentaion/pages/splash_screen.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String homeRoute = '/home';

  /// The `static final Map<String, Widget Function(BuildContext)> routes` is a map that associates
  /// route names with corresponding widget builders. In this case, the `initialRoute` is associated
  /// with a `SplashScreen` widget builder function.
  static final Map<String, Widget Function(BuildContext)> routes = {
    initialRoute: (context) => const SplashScreen(),
  };
}
