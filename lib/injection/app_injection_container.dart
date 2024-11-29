import 'package:get_it/get_it.dart';

import 'package:template/config/themes/cubit/theme_cubit.dart';
import 'package:template/core/network/api/api.dart';
import 'package:template/feature/auth/injection/default_injection_container.dart';
import 'package:template/feature/home/injection_container.dart';

final locator = GetIt.instance;
void setupDependencyInjection() {
  locator.registerSingleton(ThemeCubit());
  locator.registerSingleton(Api());
  LoginInjectionContainer().register();
  HomeInjectionContainer().register();
}
