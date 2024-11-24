import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template/config/constants/app_color.dart';

import 'themeExtension/theme_extension.dart';

SystemUiOverlayStyle lightSystemUiOverlayStyle = const SystemUiOverlayStyle(
  statusBarColor: AppLightColor.bgBackground,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: AppLightColor.bgBackground,
  systemNavigationBarIconBrightness: Brightness.dark,
);
ThemeData lightMode = ThemeData(
  scaffoldBackgroundColor: AppLightColor.bgBackground,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppLightColor.bgBackground,
    type: BottomNavigationBarType.fixed,
    // selectedItemColor: AppLightColor.textDefault,
    // unselectedItemColor: AppLightColor.textSecondary,
    showUnselectedLabels: true,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppLightColor.bgBackground,
    surfaceTintColor: AppLightColor.bgBackground,
  ),
  brightness: Brightness.light,
  extensions: const [AppColors.light],
);






















//  ThemeData(

//     useMaterial3: true,
    
  
//     scaffoldBackgroundColor: AppLightColor.bgBackground,
//     primaryColor: AppLightColor.brandPrimary,
    




//     colorScheme: const ColorScheme.light(
//       secondary: AppLightColor.bgSecondary,
//       tertiary: AppLightColor.bgTeritary,
//       surface: AppLightColor.surfaceSuccess,
      
//     ),
//     elevatedButtonTheme: const ElevatedButtonThemeData(
//         style:
//             ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red))));
