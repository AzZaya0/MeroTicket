import 'package:template/feature/ticket/presentaion/state/cubit/ticket_cubit.dart';
import 'package:template/injection/app_injection_container.dart';

class TicketInjectionContainer {
  void register() {
    locator.registerLazySingleton(
      () => TicketCubit(),
    );
  }
}
