import 'package:flutter/material.dart';
import '../../constants/app_color.dart';
class AppColors extends ThemeExtension<AppColors> {

  final Color? brandPrimary;
  final Color? brandSecondary;
  final Color? bgBackground;
  final Color? bgSecondary;
  final Color? bgTeritary;
  final Color? borderSoft;
  final Color? borderDefault;
  final Color? borderSolid;
  final Color? textDefault;
  final Color? textSecondary;
  final Color? textTeritary;
  final Color? fillSuccess;
  final Color? fillError;
  final Color? fillWarning;
  final Color? fillInfo;
  final Color? surfaceSuccess;
  final Color? surfaceError;
  final Color? surfaceWarning;
  final Color? surfaceInfo;
  final Color? baseBlack;
  final Color? baseWhite;

  const AppColors({
    required this.brandPrimary,
    required this.brandSecondary,
    required this.bgBackground,
    required this.bgSecondary,
    required this.bgTeritary,
    required this.borderSoft,
    required this.borderDefault,
    required this.borderSolid,
    required this.textDefault,
    required this.textSecondary,
    required this.textTeritary,
    required this.fillSuccess,
    required this.fillError,
    required this.fillWarning,
    required this.fillInfo,
    required this.surfaceSuccess,
    required this.surfaceError,
    required this.surfaceWarning,
    required this.surfaceInfo,
    required this.baseBlack,
    required this.baseWhite,
  });

  static const light = AppColors(
    brandPrimary: AppLightColor.brandPrimary,
    brandSecondary: AppLightColor.brandSecondary,
    bgBackground: AppLightColor.bgBackground,
    bgSecondary: AppLightColor.bgSecondary,
    bgTeritary: AppLightColor.bgTeritary,
    borderSoft: AppLightColor.borderSoft,
    borderDefault: AppLightColor.borderDefault,
    borderSolid: AppLightColor.borderSolid,
    textDefault: AppLightColor.textDefault,
    textSecondary: AppLightColor.textSecondary,
    textTeritary: AppLightColor.textTeritary,
    fillSuccess: AppLightColor.fillSuccess,
    fillError: AppLightColor.fillError,
    fillWarning: AppLightColor.fillWarning,
    fillInfo: AppLightColor.fillInfo,
    surfaceSuccess: AppLightColor.surfaceSuccess,
    surfaceError: AppLightColor.surfaceError,
    surfaceWarning: AppLightColor.surfaceWarning,
    surfaceInfo: AppLightColor.surfaceInfo,
    baseBlack: AppLightColor.baseBlack,
    baseWhite: AppLightColor.baseWhite,
  );

  static const dark = AppColors(
    brandPrimary: AppDarkColor.brandPrimary,
    brandSecondary: AppDarkColor.brandSecondary,
    bgBackground: AppDarkColor.bgBackground,
    bgTeritary: AppDarkColor.bgTeritary,
    bgSecondary: AppDarkColor.bgSecondary,
    borderSoft: AppDarkColor.borderSoft,
    borderDefault: AppDarkColor.borderDefault,
    borderSolid: AppDarkColor.borderSolid,
    textDefault: AppDarkColor.textDefault,
    textSecondary: AppDarkColor.textSecondary,
    textTeritary: AppDarkColor.textTeritary,
    fillSuccess: AppDarkColor.fillSuccess,
    fillError: AppDarkColor.fillError,
    fillWarning: AppDarkColor.fillWarning,
    fillInfo: AppDarkColor.fillInfo,
    surfaceSuccess: AppDarkColor.surfaceSuccess,
    surfaceError: AppDarkColor.surfaceError,
    surfaceWarning: AppDarkColor.surfaceWarning,
    surfaceInfo: AppDarkColor.surfaceInfo,
    baseBlack: AppDarkColor.baseBlack,
    baseWhite: AppDarkColor.baseWhite,
  );

  @override
  AppColors copyWith({
    Color? brandPrimary,
    Color? brandSecondary,
    Color? bgBackground,
    Color? bgSecondary,
    Color? bgTeritary,
    Color? borderSoft,
    Color? borderDefault,
    Color? borderSolid,
    Color? textDefault,
    Color? textSecondary,
    Color? textTeritary,
    Color? fillSuccess,
    Color? fillError,
    Color? fillWarning,
    Color? fillInfo,
    Color? surfaceSuccess,
    Color? surfaceError,
    Color? surfaceWarning,
    Color? surfaceInfo,
    Color? baseBlack,
    Color? baseWhite,
  }) {
    return AppColors(
      brandPrimary: brandPrimary ?? this.brandPrimary,
      brandSecondary: brandSecondary ?? this.brandSecondary,
      bgBackground: bgBackground ?? this.bgBackground,
      bgSecondary: bgSecondary ?? this.bgSecondary,
      bgTeritary: bgTeritary ?? this.bgTeritary,
      borderSoft: borderSoft ?? this.borderSoft,
      borderDefault: borderDefault ?? this.borderDefault,
      borderSolid: borderSolid ?? this.borderSolid,
      textDefault: textDefault ?? this.textDefault,
      textSecondary: textSecondary ?? this.textSecondary,
      textTeritary: textTeritary ?? this.textTeritary,
      fillSuccess: fillSuccess ?? this.fillSuccess,
      fillError: fillError ?? this.fillError,
      fillWarning: fillWarning ?? this.fillWarning,
      fillInfo: fillInfo ?? this.fillInfo,
      surfaceSuccess: surfaceSuccess ?? this.surfaceSuccess,
      surfaceError: surfaceError ?? this.surfaceError,
      surfaceWarning: surfaceWarning ?? this.surfaceWarning,
      surfaceInfo: surfaceInfo ?? this.surfaceInfo,
      baseBlack: baseBlack ?? this.baseBlack,
      baseWhite: baseWhite ?? this.baseWhite,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;

    return AppColors(
      brandPrimary: Color.lerp(brandPrimary, other.brandPrimary, t),
      brandSecondary: Color.lerp(brandSecondary, other.brandSecondary, t),
      bgBackground: Color.lerp(bgBackground, other.bgBackground, t),
      bgSecondary: Color.lerp(bgSecondary, other.bgSecondary, t),
      bgTeritary: Color.lerp(bgTeritary, other.bgTeritary, t),
      borderSoft: Color.lerp(borderSoft, other.borderSoft, t),
      borderDefault: Color.lerp(borderDefault, other.borderDefault, t),
      borderSolid: Color.lerp(borderSolid, other.borderSolid, t),
      textDefault: Color.lerp(textDefault, other.textDefault, t),
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t),
      textTeritary: Color.lerp(textTeritary, other.textTeritary, t),
      fillSuccess: Color.lerp(fillSuccess, other.fillSuccess, t),
      fillError: Color.lerp(fillError, other.fillError, t),
      fillWarning: Color.lerp(fillWarning, other.fillWarning, t),
      fillInfo: Color.lerp(fillInfo, other.fillInfo, t),
      surfaceSuccess: Color.lerp(surfaceSuccess, other.surfaceSuccess, t),
      surfaceError: Color.lerp(surfaceError, other.surfaceError, t),
      surfaceWarning: Color.lerp(surfaceWarning, other.surfaceWarning, t),
      surfaceInfo: Color.lerp(surfaceInfo, other.surfaceInfo, t),
      baseBlack: Color.lerp(baseBlack, other.baseBlack, t),
      baseWhite: Color.lerp(baseWhite, other.baseWhite, t),
    );
  }
}
