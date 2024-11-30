import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:template/config/router/routers.dart';
import 'package:template/core/common/controls/custom_image_network.dart';
import 'package:template/core/common/controls/custom_text.dart';
import 'package:template/core/utils/extension.dart';
import 'package:template/feature/ticket/presentaion/state/cubit/ticket_cubit.dart';

import '../../../../config/constants/asset_manager.dart';
import '../../../../config/themes/themeExtension/theme_extension.dart';
import '../../../../core/common/controls/custom_button.dart';

class MyTicket extends StatelessWidget {
  const MyTicket({super.key});
  String formatDate(DateTime date) {
    // Define the desired format
    final DateFormat formatter = DateFormat('ddMMM');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'My Tickets',
          color: appColors(context).black,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<TicketCubit, TicketState>(
          builder: (context, state) {
            // return Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     lottieLoader(
            //         ctx: context, lottieAsset: LottieAssets.myTicketLottie),
            //     CustomText(
            //       text: 'No Tickets',
            //       color: appColors(context).primary,
            //     ),
            //   ],
            // );

            return ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return CustomButton(
                  height: null,
                  width: null,
                  dynamicSize: true,
                  padding: EdgeInsets.all(8.h),
                  radius: 12.h,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.eventDetailRoute,
                      arguments: {'eventId': 1, 'isTicket': true},
                    );
                  },
                  elevation: 0.5,
                  color: appColors(context).brandSecondary,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18.h),
                        child: CustomImageNetwork(
                            imageUrl:
                                'https://offloadmedia.feverup.com/parissecret.com/wp-content/uploads/2023/09/06110716/Montage-photos-articles-PS-2023-12-06T110657.772-1024x683.jpg',
                            boxFit: BoxFit.cover,
                            height: 100.h,
                            width: 90.h),
                      ),
                      Gap(16.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Concert',
                            color: appColors(context).black,
                            fontWeight: FontWeight.w500,
                            size: 16.h,
                          ),
                          CustomText(
                            text: 'Kathmandu',
                            color: appColors(context).gray600,
                            size: 14.h,
                            fontWeight: FontWeight.w400,
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: formatDate(DateTime.now()),
                                size: 14.h,
                                color: appColors(context).gray400,
                              ),
                              CustomText(
                                text: '-',
                                size: 14.h,
                                color: appColors(context).gray400,
                              ),
                              CustomText(
                                text: formatDate(DateTime.now()),
                                size: 14.h,
                                color: appColors(context).gray400,
                              ),
                              SizedBox(
                                height: 30,
                                width: 40,
                                child: Stack(
                                  children: [
                                    ...List.generate(
                                      2,
                                      (vendorIndex) {
                                        return Positioned(
                                          right: vendorIndex * (20.h / 1.5),
                                          child: Container(
                                            margin: EdgeInsets.all(2.h),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 3,
                                                    color: appColors(context)
                                                        .brandSecondary!),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        9000)),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(999),
                                              child: CustomImageNetwork(
                                                  imageUrl: '',
                                                  boxFit: BoxFit.cover,
                                                  height: 20.h,
                                                  width: 20.h),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          CustomText(
                            text: 'Music',
                            size: 12.h,
                            color: appColors(context).orange600,
                          )
                        ],
                      ),
                    ],
                  ),
                ).addMargin(EdgeInsets.all(8.h));
              },
            );
          },
        ),
      ),
    );
  }
}
