import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:template/config/themes/themeExtension/theme_extension.dart';

import 'package:template/core/common/controls/custom_text.dart';
import 'package:template/core/common/controls/custom_textfield.dart';
import 'package:template/core/utils/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors(context).gray100,
      appBar: AppBar(
        backgroundColor: appColors(context).gray100,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: 'Events',
              size: 28,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: appColors(context).bgBackground,
              child: Column(
                children: [
                  Gap(18.h),
                  Row(
                    children: [
                      const Icon(Icons.sunny),
                      Gap(6.h),
                      const CustomText(
                        text: 'Choose your next destination',
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                  Gap(20.h),
                  CustomTextField(
                    controller: TextEditingController(),
                    hintText: 'Search your event',
                    hintColor: appColors(context).gray400,
                    prefix: const Icon(Icons.search),
                  ),
                  Gap(16.h),
                  Row(
                    children: List.generate(
                      4,
                      (index) {
                        return Container(
                          margin: EdgeInsets.only(right: 12.h),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          decoration: BoxDecoration(
                              color: appColors(context).gray100,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text('yeyy'),
                        );
                      },
                    ),
                  ),
                  Gap(10.h)
                ],
              ).addMargin(EdgeInsets.symmetric(horizontal: 16.h)),
            ),
            events(context, 'This month'),
            events(context, 'Top Selling'),
            events(context, 'concerts')
          ],
        ).addMargin(EdgeInsets.symmetric(horizontal: 16.h)),
      )),
    );
  }

  Widget events(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(24.h),
        CustomText(
          text: title,
          color: appColors(context).gray800,
        ),
        Row(
          children: [
            const Icon(Icons.circle),
            Gap(6.h),
            const CustomText(
              text: 'Top Pick\'s',
              size: 24,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
        Gap(14.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              4,
              (index) {
                return Container(
                  // height: 400,
                  clipBehavior: Clip.antiAlias,
                  // width: 300.h,
                  decoration: BoxDecoration(
                      color: appColors(context).bgBackground,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://vancouver.ca/images/cov/feature/crowd-hands-clapping.jpg',
                          height: 150.h,
                          width: 250.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Gap(10.h),
                      Card(
                        color: appColors(context).primary,
                        child: CustomText(
                          text: 'Art',
                          color: appColors(context).bgBackground,
                        ).addPadding(EdgeInsets.symmetric(horizontal: 15.h)),
                      ),
                      Gap(4.h),
                      CustomText(
                        text: 'The Planter Show',
                        size: 20.h,
                        color: appColors(context).gray800,
                      ),
                      CustomText(
                        text: 'September 24',
                        color: appColors(context).gray800,
                        size: 12.h,
                      ),
                      CustomText(
                        text: 'by meroVision.inc',
                        color: appColors(context).gray800,
                        size: 14.h,
                      ),
                    ],
                  ).addPadding(const EdgeInsets.all(10)),
                ).addMargin(const EdgeInsets.only(
                  right: 10,
                ));
              },
            ),
          ),
        ),
      ],
    );
  }
}
