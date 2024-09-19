import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'widget_themes/text_themes.dart';

class AppTheme {
  static appLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      // Font Family
      // Text Theme
      textTheme: KTextThemes.lightTextTheme(),
      // App Bar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: KColors.whiteColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 70,
        iconTheme: IconThemeData(
          color: KColors.blackColor,
        ),
      ),
      // Scaffold Background Color
      scaffoldBackgroundColor: KColors.whiteColor,
      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: KColors.blackColor,
          backgroundColor: KColors.offWhiteColor,
          textStyle: KTextThemes.lightTextTheme().titleSmall,
          minimumSize: const Size(100, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          animationDuration: const Duration(milliseconds: 150),
        ),
      ),
      // Scrollbar Theme
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(KColors.accentColor),
        trackColor: MaterialStateProperty.all(KColors.todoColor),
        interactive: true,
        thumbVisibility: MaterialStateProperty.all(true),
        radius: const Radius.circular(20),
        trackVisibility: MaterialStateProperty.all(false),
      ),
      // Drawer Theme
      drawerTheme: const DrawerThemeData(
        elevation: 0,
        backgroundColor: KColors.offWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: KColors.whiteColor,
        hintStyle: KTextThemes.lightTextTheme().bodySmall,
        labelStyle: KTextThemes.lightTextTheme().bodySmall,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: KColors.todoColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: KColors.accentColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: KColors.accentColor,
          ),
        ),
      ),
      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: KTextThemes.lightTextTheme().bodySmall,
          elevation: 5,
          backgroundColor: KColors.transparentColor,
        ),
      ),
      iconTheme: const IconThemeData(
        color: KColors.blackColor,
      ),
    );
  }

  static appDarkTheme() {
    return ThemeData(
      // Brightness
      brightness: Brightness.dark,
      useMaterial3: true,
      // Text Theme
      textTheme: KTextThemes.darkTextTheme(),
      // App Bar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: KColors.blackColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 70,
        iconTheme: IconThemeData(
          color: KColors.whiteColor,
        ),
      ),
      // Scaffold Background Color
      scaffoldBackgroundColor: KColors.blackColor,
      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: KColors.offBlackColor,
          foregroundColor: KColors.whiteColor,
          textStyle: KTextThemes.lightTextTheme().titleSmall,
          minimumSize: const Size(100, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          animationDuration: const Duration(milliseconds: 150),
        ),
      ),
      // Scrollbar Theme
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(KColors.accentColor),
        trackColor: MaterialStateProperty.all(KColors.todoColor),
        interactive: true,
        thumbVisibility: MaterialStateProperty.all(true),
        radius: const Radius.circular(20),
        trackVisibility: MaterialStateProperty.all(false),
      ),
      // Drawer Theme
      drawerTheme: const DrawerThemeData(
        elevation: 0,
        backgroundColor: KColors.offBlackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: KColors.offBlackColor,
        hintStyle: KTextThemes.lightTextTheme().bodySmall,
        labelStyle: KTextThemes.lightTextTheme().bodySmall,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: KColors.todoColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: KColors.accentColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: KColors.accentColor,
          ),
        ),
      ),
      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: KTextThemes.lightTextTheme().bodySmall,
          elevation: 5,
          backgroundColor: KColors.transparentColor,
        ),
      ),
      iconTheme: const IconThemeData(
        color: KColors.whiteColor,
      ),
    );
  }
}
