import 'package:get_it/get_it.dart';
import 'package:template/feature/auth/presentaion/state/login_cubit.dart';

class AnotherInjectionContainer {
  var get = GetIt.instance;

  void register() {
    get.registerLazySingleton(
      () => LoginCubit(),
    );
  }
}
