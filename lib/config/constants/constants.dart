import 'package:flutter/material.dart';

class GlobalConstants {
  static const Size tabletSize = Size(600, 1024);

  /// The `textStyle` function returns a `TextStyle` object with the specified font family, font size,
  /// font weight, and color.
  /// 
  /// Args:
  ///   family: The font family to be used for the text. Defaults to Sans
  ///   fontSize (double): The `fontSize` parameter is used to specify the size of the text. It is of
  /// type `double` and has a default value of 14. Defaults to 14
  ///   fontWeight (FontWeight): The `fontWeight` parameter is used to specify the weight of the text.
  /// It is of type `FontWeight` and has a default value of `FontWeight.w400`, which represents the
  /// normal font weight. Other possible values for `fontWeight` include `FontWeight.w100` (thin), `.
  /// Defaults to FontWeight
  ///   color (Color): The color parameter is an optional parameter that specifies the color of the
  /// text. It is of type Color? which means it can be either a Color object or null. The default value
  /// for color is KColors.whiteColor. Defaults to KColors
  /// 
  /// Returns:
  ///   a TextStyle object.
  static textStyle({
    family = 'Sans',
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color? color = KColors.whiteColor,
  }) {
    return TextStyle(
      fontFamily: family,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}

/// The class KColors defines a set of static color constants in Dart.
class KColors {
  static const transparentColor = Colors.transparent;
  static const whiteColor = Color(0xFFFAFAFA);
  static const blackColor = Color(0xFF101010);
  static const offBlackColor = Color(0xFF1E1E1E);
  static const offBlackColorTwo = Color(0xFF383838);
  static const offWhiteColor = Color(0xFFE1E7EC);
  static const offWhiteColorTwo = Color(0xFF696C6E);
  static const offWhiteColorThree = Color.fromARGB(255, 184, 189, 192);
  static const greyColor = Color(0xFF666666);
  static const accentColor = Color(0xFFFFC800);
  static const todoColor = Colors.red;
}
