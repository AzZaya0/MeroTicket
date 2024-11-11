// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:template/config/constants/constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double? radius;
  final double? width;
  final double? height;
  final Color? color;
  final Color? overlayColor;
  final String? text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Widget? child;
  final BorderSide? borderSide;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final bool? dynamicSize;
  const CustomButton({
    Key? key,
    this.onTap,
    this.radius,
    this.width,
    this.height,
    this.color,
    this.overlayColor,
    this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.child,
    this.borderSide,
    this.elevation,
    this.padding,
    this.dynamicSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            overlayColor: WidgetStatePropertyAll(overlayColor),
            minimumSize:
                WidgetStatePropertyAll(Size(width ?? 350, height ?? 55)),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                side: borderSide ?? BorderSide.none,
                borderRadius: BorderRadius.circular(radius ?? 100),
              ),
            ),

            ///  [If_needed] //

            fixedSize: WidgetStateProperty.all(
              !(dynamicSize ?? false) ? Size(width ?? 350, height ?? 55) : null,
            ),
            backgroundColor: WidgetStateProperty.all(
              color ?? KColors.todoColor,
            ),
            elevation: WidgetStatePropertyAll(elevation),
            padding: WidgetStatePropertyAll(padding)),
        child: text != null
            ? Text(
                text!,
                style: TextStyle(
                  fontSize: fontSize ?? 20,
                  color: textColor ?? KColors.blackColor,
                  fontWeight: fontWeight ?? FontWeight.bold,
                ),
              )
            : child);
  }
}

// Replace AppColor and FontWeightManager with your actual definitions
