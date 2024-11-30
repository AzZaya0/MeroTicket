import 'package:flutter/material.dart';
import 'package:template/feature/auth/presentaion/pages/login_page.dart';
import 'package:template/feature/auth/presentaion/pages/sign_up_page.dart';
import 'package:template/feature/auth/presentaion/pages/vendor_sign_up.dart';
import 'package:template/feature/event/presentation/pages/event_detail.dart';
import 'package:template/feature/event/presentation/pages/new_event_page.dart';
import 'package:template/feature/home/bottom_nav_bar/main_nav_bar.dart';
import 'package:template/feature/home/page/search_page.dart';
import '../../feature/event/data/models/my_events_model.dart';
import '../../feature/splash/presentaion/pages/splash_screen.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String mainNavRoute = '/navRoute';
  static const String signUpRoute = '/signUpRoute';
  static const String vendorSignUpRoute = '/vendorSignUpRoute';
  static const String newEventRoute = '/newEventRoute';
  static const String eventDetailRoute = '/eventDetail';
  static const String searchPageRoute = '/searchPageRoute';

  static final Map<String, Widget Function(BuildContext)> routes = {
    initialRoute: (context) => const SplashScreen(),
    loginRoute: (context) => const LoginPage(),
    signUpRoute: (context) => const SignUpPage(),
    vendorSignUpRoute: (context) => const VendorSignUp(),
    mainNavRoute: (context) => const MainNavBar(),
    newEventRoute: (context) => const NewEventPage(),
    searchPageRoute: (context) => const SearchPage(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case newEventRoute:
        return MaterialPageRoute(builder: (_) => const NewEventPage());

      case eventDetailRoute:
        final args = settings.arguments as Map<String, dynamic>?;

        // Ensure arguments are passed
        if (args != null) {
          final int? eventId = args['eventId'] ?? '';
          final bool? isTicket = args['isTicket'] ?? '';

          return MaterialPageRoute(
            builder: (_) => EventDetail(
              eventId: eventId,
              isTicket: isTicket,
            ),
          );
        }
        // Fallback if no arguments are provided
        return MaterialPageRoute(
          builder: (_) => const EventDetail(
            eventId: null,
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
