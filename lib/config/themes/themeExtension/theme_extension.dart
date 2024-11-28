import 'package:flutter/material.dart';
import '../../constants/app_color.dart';

AppColors appColors(BuildContext context) {
  final appColor = Theme.of(context).extension<AppColors>()!;
  return appColor;
}

class AppColors extends ThemeExtension<AppColors> {
  final Color? primary;
  final Color? brandSecondary;
  final Color? bgBackground;
//shades of gray
  final Color? black;
  final Color? gray100;
  final Color? gray400;
  final Color? gray600;
  final Color? gray800;

  // shade of blue
  final Color? primaryBlue;
//orange shades
  final Color? orange600;
  const AppColors(
      {required this.primary,
      required this.brandSecondary,
      required this.bgBackground,
      required this.black,
      required this.gray100,
      required this.gray400,
      required this.gray600,
      required this.gray800,
      required this.primaryBlue,
      required this.orange600});

  static const light = AppColors(
    primary: AppLightColor.primary,
    brandSecondary: AppLightColor.brandSecondary,
    bgBackground: AppLightColor.bgBackground,
    black: AppLightColor.black,
    gray100: AppLightColor.gray100,
    gray400: AppLightColor.gray400,
    gray600: AppLightColor.gray600,
    gray800: AppLightColor.gray800,
    primaryBlue: AppLightColor.primaryBlue,
    orange600: AppLightColor.orange600,
  );

  static const dark = AppColors(
    primary: AppDarkColor.brandPrimary,
    brandSecondary: AppDarkColor.brandSecondary,
    bgBackground: AppDarkColor.bgBackground,
    black: AppLightColor.black,
    gray100: AppLightColor.gray100,
    gray400: AppLightColor.gray400,
    gray600: AppLightColor.gray600,
    gray800: AppLightColor.gray800,
    primaryBlue: AppLightColor.primaryBlue,
    orange600: AppLightColor.orange600,
  );

  @override
  AppColors copyWith({
    Color? primary,
    Color? brandSecondary,
    Color? bgBackground,
    //shades of gray
    Color? black,
    Color? gray100,
    Color? gray400,
    Color? gray600,
    Color? gray800,
    Color? orange600,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      brandSecondary: brandSecondary ?? this.brandSecondary,
      bgBackground: bgBackground ?? this.bgBackground,
      black: black ?? this.black,
      gray100: gray100 ?? this.gray100,
      gray400: gray400 ?? this.gray400,
      gray600: gray600 ?? this.gray600,
      gray800: gray800 ?? this.gray800,
      primaryBlue: AppLightColor.primaryBlue,
      orange600: orange600 ?? AppLightColor.orange600,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;

    return AppColors(
      primary: Color.lerp(primary, other.primary, t),
      black: Color.lerp(black, other.black, t),
      brandSecondary: Color.lerp(brandSecondary, other.brandSecondary, t),
      bgBackground: Color.lerp(bgBackground, other.bgBackground, t),
      gray100: Color.lerp(gray100, other.gray100, t),
      gray400: Color.lerp(gray400, other.gray400, t),
      gray600: Color.lerp(gray600, other.gray600, t),
      gray800: Color.lerp(gray800, other.gray800, t),
      primaryBlue: Color.lerp(primaryBlue, other.orange600, t),
      orange600: Color.lerp(orange600, other.orange600, t),
    );
  }
}
