// ignore: file_names
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.fontName,
    this.color,
    this.size,
    this.maxLines,
    this.onTap,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.height,
    this.textAlign,
  }) : super(key: key);
  //initializing variables
  final String text;
  final String? fontName;
  final Color? color;
  final double? size;
  final int? maxLines;
  final void Function()? onTap;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextDecoration? textDecoration;
  final double? height;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        textAlign: textAlign,
        text,
        maxLines: maxLines ?? 50,
        style: GoogleFonts.poppins(
            color: color ?? Theme.of(context).primaryColor,
            fontSize: size ?? 18,
            fontStyle: fontStyle,
            decoration: textDecoration,
            decorationColor: color,
            height: height,
            fontWeight: fontWeight),
      ),
    );
  }
}
