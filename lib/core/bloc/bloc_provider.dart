import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/config/themes/cubit/theme_cubit.dart';
import 'package:template/feature/auth/presentaion/state/login_cubit.dart';
import 'package:template/feature/home/bottom_nav_bar/cubit/main_nav_cubit.dart';
import 'package:template/injection/app_injection_container.dart';

class BlocProvidersList {
  static final blocList = [
    // Add all blocs here,
    // Authentication Cubit,
    BlocProvider<ThemeCubit>(
      create: (_) => locator<ThemeCubit>(),
    ),
    BlocProvider<LoginCubit>(
      create: (_) => locator<LoginCubit>(),
    ),
    BlocProvider<MainNavCubit>(
      create: (_) => locator<MainNavCubit>(),
    )
  ];
}
