import 'package:flutter/material.dart';
import 'package:template/feature/auth/presentaion/pages/login_page.dart';
import 'package:template/feature/auth/presentaion/pages/sign_up_page.dart';
import 'package:template/feature/auth/presentaion/pages/vendor_sign_up.dart';
import 'package:template/feature/event/data/models/my_tickets_model.dart';
import 'package:template/feature/event/presentation/pages/event_detail.dart';
import 'package:template/feature/event/presentation/pages/event_history.dart';
import 'package:template/feature/event/presentation/pages/event_users.dart';
import 'package:template/feature/event/presentation/pages/new_event_page.dart';
import 'package:template/feature/home/bottom_nav_bar/main_nav_bar.dart';
import 'package:template/feature/home/page/search_page.dart';
import 'package:template/feature/ticket/presentaion/pages/ticket_detail_page.dart';
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
  static const String ticketDetailPage = '/ticketDetailPage';
  static const String eventHistoryPage = '/eventHistoryPage';
  static const String eventUsersPage = '/eventUsersPage';

  static final Map<String, Widget Function(BuildContext)> routes = {
    initialRoute: (context) => const SplashScreen(),
    loginRoute: (context) => const LoginPage(),
    signUpRoute: (context) => const SignUpPage(),
    vendorSignUpRoute: (context) => const VendorSignUp(),
    mainNavRoute: (context) => const MainNavBar(),
    newEventRoute: (context) => const NewEventPage(),
    searchPageRoute: (context) => const SearchPage(),
    eventHistoryPage: (context) => const EventHistory(),
    // eventUsersPage: (context) => const EventUsersPage(),
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
          final bool? isTicket = args['isTicket'] ?? false;
          final bool? viewTicket = args['viewTicket'] ?? true;

          return MaterialPageRoute(
            builder: (_) => EventDetail(
              eventId: eventId,
              isTicket: isTicket,
              viewTicket: viewTicket,
            ),
          );
        }

        // Fallback if no arguments are provided
        return MaterialPageRoute(
          builder: (_) => const EventDetail(
            eventId: null,
          ),
        );
      case eventUsersPage:
        final args = settings.arguments as Map<String, dynamic>?;

        // Ensure arguments are passed
        if (args != null) {
          final int? eventId = args['eventId'] ?? 0;

          return MaterialPageRoute(
            builder: (_) => EventUsersPage(
              eventId: eventId,
            ),
          );
        }

        // Fallback if no arguments are provided
        return MaterialPageRoute(
          builder: (_) => const EventUsersPage(
            eventId: null,
          ),
        );
      case ticketDetailPage:
        final args = settings.arguments as Map<String, dynamic>?;

        // Ensure arguments are passed
        if (args != null) {
          final Event? eventData = args['eventData'] ?? '';
          final EventTicket? ticketDetail = args['ticketData'] ?? '';
          final String? userTicketId = args['user_ticket_id'] ?? '';

          return MaterialPageRoute(
            builder: (_) => TicketDetailPage(
              ticketDetail: ticketDetail,
              eventData: eventData,
              userTicketId: userTicketId,
            ),
          );
        }
        return MaterialPageRoute(
          builder: (_) => const TicketDetailPage(),
        );
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
