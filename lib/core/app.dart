import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/config/themes/cubit/theme_cubit.dart';
import 'package:template/config/themes/dark_theme.dart';
import 'package:template/config/themes/light_theme.dart';

import '../config/router/routers.dart';
import 'bloc/bloc_provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProvidersList.blocList,
      child: BlocBuilder<ThemeCubit, ThemeData>(builder: (context, theme) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final isDarkMode = theme.brightness == Brightness.dark;
          SystemChrome.setSystemUIOverlayStyle(
            isDarkMode ? darkSystemUiOverlayStyle : lightSystemUiOverlayStyle,
          );
        });
        return ScreenUtilInit(
          designSize: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height,
          ),
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme,
              builder: EasyLoading.init(),
              routes: AppRoutes.routes,
              onGenerateRoute: AppRoutes.generateRoute,
              ),
        );
      }),
    );
  }
}
