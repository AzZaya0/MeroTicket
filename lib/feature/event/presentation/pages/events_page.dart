import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:template/config/themes/themeExtension/theme_extension.dart';
import 'package:template/core/common/controls/custom_text.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'My Events'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(8.h),
            margin: EdgeInsets.all(8.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.h),
                color: appColors(context).gray100),
            child: InkWell(
              onTap: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100.h,
                    width: 100.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.h),
                        color: appColors(context).bgBackground),
                  ),
                  Gap(16.h),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Title',
                          color: appColors(context).gray800,
                          fontWeight: FontWeight.w500,
                        ),
                        CustomText(
                          text: 'location ',
                          color: appColors(context).gray400,
                          fontWeight: FontWeight.w500,
                          size: 12.h,
                        ),
                        CustomText(
                          text:
                              'description dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd',
                          color: appColors(context).gray800,
                          fontWeight: FontWeight.w500,
                          size: 12.h,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: 'Owner / Vendor',
                              color: appColors(context).gray800,
                              fontWeight: FontWeight.w400,
                              size: 14.h,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
