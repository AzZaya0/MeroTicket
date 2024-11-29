import 'package:template/core/common/controls/pick_image/image_picker_cubit.dart';
import 'package:template/feature/auth/data/data_sources/remote_data_sources/default_login_repo.dart';
import 'package:template/feature/auth/domain/repository/login_repo.dart';
import 'package:template/feature/auth/presentaion/state/login_cubit.dart';
import 'package:template/injection/app_injection_container.dart';

class LoginInjectionContainer {
  void register() {
    locator.registerLazySingleton<LoginRepo>(
      () => DefaultLoginRepo(api: locator()),
    );

    locator.registerLazySingleton(
      () => LoginCubit(loginRepo: locator()),
    );
    locator.registerLazySingleton(
      () => ImagePickerCubit(),
    );
  }
}
