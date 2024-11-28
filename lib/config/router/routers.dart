import 'package:flutter/material.dart';
import 'package:template/feature/auth/presentaion/pages/login_page.dart';
import 'package:template/feature/auth/presentaion/pages/sign_up_page.dart';
import 'package:template/feature/event/presentation/pages/new_event_page.dart';
import 'package:template/feature/home/bottom_nav_bar/main_nav_bar.dart';

import '../../feature/splash/presentaion/pages/splash_screen.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String mainNavRoute = '/navRoute';
  static const String signUpRoute = '/signUpRoute';
  static const String newEventRoute = '/newEventRoute';

  static const String homeRoute = '/home';

  /// The `static final Map<String, Widget Function(BuildContext)> routes` is a map that associates
  /// route names with corresponding widget builders. In this case, the `initialRoute` is associated
  /// with a `SplashScreen` widget builder function.
  static final Map<String, Widget Function(BuildContext)> routes = {
    initialRoute: (context) => const SplashScreen(),
    loginRoute: (context) => const LoginPage(),
    signUpRoute: (context) => const SignUpPage(),
    mainNavRoute: (context) => const MainNavBar(),
    newEventRoute: (context) => const NewEventPage(),
  };
}
