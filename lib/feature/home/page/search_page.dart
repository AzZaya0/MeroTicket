import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/config/themes/themeExtension/theme_extension.dart';

import '../search_event_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: appColors(context).gray100,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(8.h),
        width: double.infinity,
        child: SearchEventWidget(),
      )),
    );
  }
}
