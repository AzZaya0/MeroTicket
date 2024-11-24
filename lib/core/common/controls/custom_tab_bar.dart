// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/config/themes/themeExtension/theme_extension.dart';

// ignore: must_be_immutable
class CustomTabBar extends StatelessWidget {
  CustomTabBar({
    Key? key,
    Key? newKey,
    required this.tabController,
    required this.tabs,
    this.scrollPhysics,
  }) : super(key: newKey);

  final TabController tabController;
  final List<Tab> tabs;
  final ScrollPhysics? scrollPhysics;
  GlobalKey? newKey;

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).extension<AppColors>()!;
    return ButtonsTabBar(
        key: newKey,
        radius: 100.h,
        buttonMargin: EdgeInsets.only(left: 16.h, bottom: 10.h),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h),
        labelStyle: GoogleFonts.poppins(
          color: appColor.primary,
          fontSize: 14.h,
        ),
        backgroundColor: appColor.bgBackground,
        unselectedBackgroundColor: appColor.bgBackground,
        unselectedLabelStyle: GoogleFonts.poppins(
          color: appColor.brandSecondary,
          fontSize: 14.h,
        ),
        borderColor: Colors.transparent,
        physics: scrollPhysics ?? const AlwaysScrollableScrollPhysics(),
        controller: tabController,
        tabs: tabs);
  }
}
