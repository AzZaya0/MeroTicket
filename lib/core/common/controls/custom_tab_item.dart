import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/config/themes/themeExtension/theme_extension.dart';
import 'package:template/core/common/controls/custom_text.dart';

class CustomTabItem extends StatelessWidget {
  const CustomTabItem({
    super.key,
    required this.newIndex,
    required this.title,
    required this.neededIndex,
  });

  final int newIndex;
  final String title;
  final int neededIndex;

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<AppColors>()!;
    return Tab(
      height: 35.h,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color: newIndex == neededIndex
                ? Colors.transparent
                : customColors.primary),
        child: CustomText(
            text: title,
            size: 12.h,
            fontWeight: FontWeight.w400,
            color: newIndex == neededIndex ? Colors.white : customColors.primary
            // : AppColor.greyText,
            ),
      ),
    );
  }
}
