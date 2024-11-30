import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:template/config/themes/themeExtension/theme_extension.dart';
import 'package:template/core/common/controls/custom_button.dart';
import 'package:template/core/common/controls/custom_image_network.dart';
import 'package:template/core/common/controls/custom_text.dart';
import 'package:template/core/utils/extension.dart';
import 'package:template/feature/event/data/models/get_event_by_id.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class BottomSheetPages {
  firstPage(
      {required BuildContext context,
      required Function nextPage,
      List<EventTicket>? eventTickets}) {
    return SliverWoltModalSheetPage(
        hasTopBarLayer: false,
        surfaceTintColor: appColors(context).brandSecondary,
        backgroundColor: appColors(context).brandSecondary,
        mainContentSlivers: [
          SliverToBoxAdapter(
              child: Container(
            color: appColors(context).gray100,
            padding: EdgeInsets.all(16.h),
            // height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(16.h),
                CustomText(
                  text: 'Select Ticket ',
                  color: appColors(context).gray800,
                  fontWeight: FontWeight.w500,
                ),
                Gap(16.h),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: eventTickets?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            nextPage();
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: 50,
                            width: double.infinity,
                            child: Row(
                              children: [
                                CustomText(
                                  text:
                                      eventTickets?[index].ticketType ?? 'N/A',
                                  color: appColors(context).gray800,
                                ),
                                const Spacer(),
                                CustomText(
                                    text: eventTickets?[index].ticketPrice ??
                                        'N/A',
                                    color: appColors(context).gray400)
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 0.h,
                          thickness: 0.5,
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ))
        ],
        forceMaxHeight: false);
  }

  secondPage({required BuildContext context, required Function previous}) {
    return SliverWoltModalSheetPage(
        hasTopBarLayer: false,
        surfaceTintColor: appColors(context).brandSecondary,
        backgroundColor: appColors(context).brandSecondary,
        mainContentSlivers: [
          SliverToBoxAdapter(
              child: Container(
            color: appColors(context).gray100,
            padding: EdgeInsets.all(16.h),
            height: 200,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    tiles(context, 'Cash On Ticket',
                        'https://www.creativefabrica.com/wp-content/uploads/2020/10/26/paper-money-cash-vector-illustration-Graphics-6296757-1-1-580x386.jpg'),
                    tiles(context, 'esewa',
                        'https://republicaimg.nagariknewscdn.com/shared/web/uploads/media/esewa_20200118185351.jpg'),
                  ],
                ),
                Gap(20.h)
              ],
            ),
          )),
        ],
        stickyActionBar: Row(
          children: [
            CustomButton(
              onTap: () {
                previous();
              },
              height: 50,
              radius: 8.h,
              color: appColors(context).primary!,
              width: 150.h,
              text: 'Previous',
              textColor: appColors(context).brandSecondary,
            ).addMargin(EdgeInsets.all(8.h)),
          ],
        ),
        forceMaxHeight: false);
  }

  Container tiles(
    BuildContext context,
    String title,
    String imageUrl,
  ) {
    return Container(
      height: 100.h,
      width: 150.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.h),
          color: appColors(context).brandSecondary),
      child: Column(
        children: [
          Gap(8.h),
          CustomImageNetwork(
              imageUrl: imageUrl, boxFit: BoxFit.cover, height: 50, width: 50),
          Gap(4.h),
          CustomText(
            text: title,
            size: 12.h,
            color: appColors(context).gray800,
          ),
        ],
      ),
    );
  }
}
