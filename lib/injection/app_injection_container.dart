import 'package:get_it/get_it.dart';
import 'package:template/config/themes/cubit/theme_cubit.dart';
import 'package:template/feature/auth/injection/default_injection_container.dart';
import 'package:template/feature/home/injection_container.dart';

final locator = GetIt.instance;
void setupDependencyInjection() {
  // ? AnotherInjectionContainer().register();
  /// Example of [AnotherInjectionContainer] flunction
  ///

  locator.registerSingleton(ThemeCubit());

  AnotherInjectionContainer().register();
  HomeInjectionContainer().register();

  /// `GetIt.instance.registerLazySingleton(() => SomeClass());` is registering a lazy singleton
  /// instance of the `SomeClass` class in the dependency injection container provided by the `GetIt`
  /// package.
  // ? GetIt.instance.registerLazySingleton(() => SomeClass());
}
