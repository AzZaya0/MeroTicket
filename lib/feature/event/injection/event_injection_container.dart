import 'package:template/feature/event/data/data_sources/remote_data_sources/event_data_source.dart';
import 'package:template/feature/event/data/repository/event_repo.dart';
import 'package:template/feature/event/presentation/state/event_cubit/event_cubit.dart';
import 'package:template/injection/app_injection_container.dart';

class EventInjectionContainer {
  void register() {
    locator.registerLazySingleton<EventRepo>(
      () => EventDataSource(api: locator(), preferences: locator()),
    );
    locator.registerLazySingleton(
      () => EventCubit(locator()),
    );
  }
}
