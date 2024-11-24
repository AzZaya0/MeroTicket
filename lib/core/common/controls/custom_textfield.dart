// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/config/themes/themeExtension/theme_extension.dart';

import '../../../config/constants/asset_manager.dart';

class CustomTextField extends StatefulWidget {
  final bool isPasswordField;
  final bool? obscureText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final Widget? prefix;
  final Widget? suffix;
  final String? hintText;
  final BorderSide? borderSide;
  final FocusNode? focusNode;
  final Color? filledColor;
  final Color? hintColor;
  final int? maxLines;
  final int? minLines;
  final bool? expands;
  final TextStyle? hintTextStyle;
  final double? radius;
  final String? initialValue;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmit;
  const CustomTextField({
    Key? key,
    this.isPasswordField = false,
    this.obscureText,
    required this.controller,
    this.validator,
    this.prefix,
    this.suffix,
    this.hintText,
    this.borderSide,
    this.focusNode,
    this.filledColor,
    this.hintColor,
    this.maxLines,
    this.minLines,
    this.expands,
    this.hintTextStyle,
    this.radius,
    this.initialValue,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmit,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  var tapped = true;
  var icon = SvgAssets.logoutModuleEyeClosed;
  void isTapped() {
    tapped = !tapped;
    if (tapped) {
      icon = SvgAssets.logoutModuleEyeClosed;
    } else {
      icon = SvgAssets.logoutModuleEye;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).extension<AppColors>()!;
    return TextFormField(
      textInputAction: widget.textInputAction,
      initialValue: widget.initialValue,
      obscureText:
          widget.isPasswordField ? tapped : (widget.obscureText ?? false),
      controller: widget.controller,
      focusNode: widget.focusNode,
      expands: widget.expands ?? false,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmit,
      keyboardType: widget.keyboardType,
      minLines: widget.minLines ?? (widget.expands ?? false ? null : 1),
      maxLines: widget.isPasswordField ? 1 : widget.maxLines,
      decoration: InputDecoration(
        prefixIcon: widget.prefix, filled: true, // Set filled to true

        fillColor: widget.filledColor ?? appColor.bgBackground,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.h),
        hintText: widget.hintText,

        hintStyle: widget.hintTextStyle ??
            TextStyle(
              fontSize: 14.h,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w400,
              color: widget.hintColor ?? appColor.bgBackground,
            ),
        suffixIcon: widget.isPasswordField
            ? GestureDetector(
                onTap: isTapped,
                child: Container(
                  padding: EdgeInsets.all(12.h),
                  child: SvgPicture.asset(
                    icon, height: 50, width: 50,
                    colorFilter: const ColorFilter.mode(
                        Color(0xff8d9aab), BlendMode.srcIn),
                    // height: 2,
                  ),
                ),
              )
            : widget.suffix,
        enabledBorder: OutlineInputBorder(
          borderSide: widget.borderSide ?? BorderSide.none,
          borderRadius: BorderRadius.circular(widget.radius ?? 12.h),
        ),

        border: OutlineInputBorder(
          borderSide: widget.borderSide ?? BorderSide.none,
          borderRadius: BorderRadius.circular(widget.radius ?? 12.h),
        ),
      ),
    );
  }
}
