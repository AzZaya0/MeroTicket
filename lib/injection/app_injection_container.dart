// import 'package:get_it/get_it.dart';

void setupDependencyInjection() {
  // ? AnotherInjectionContainer().register();
  /// Example of [AnotherInjectionContainer] flunction
  ///
  /// class AnotherInjectionContainer {
  ///   var get = GetIt.instance;
  ///
  ///   void register() {
  ///     get.registerLazySingleton(
  ///       () => SomeClass(
  ///         someparamater: get<SomeAnotherClass>(),
  ///       ),
  ///     );
  ///   }
  /// }

  /// `GetIt.instance.registerLazySingleton(() => SomeClass());` is registering a lazy singleton
  /// instance of the `SomeClass` class in the dependency injection container provided by the `GetIt`
  /// package.
  // ? GetIt.instance.registerLazySingleton(() => SomeClass());
}
