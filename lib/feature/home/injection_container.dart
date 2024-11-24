import 'package:get_it/get_it.dart';
import 'package:template/feature/home/bottom_nav_bar/cubit/main_nav_cubit.dart';

class HomeInjectionContainer {
  var get = GetIt.instance;

  void register() {
    get.registerLazySingleton(
      () => MainNavCubit(),
    );
  }
}
