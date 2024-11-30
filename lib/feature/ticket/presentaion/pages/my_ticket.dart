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

class MyTicket extends StatefulWidget {
  const MyTicket({super.key});

  @override
  State<MyTicket> createState() => _MyTicketState();
}

class _MyTicketState extends State<MyTicket> {
  String formatDate(DateTime date) {
    // Define the desired format
    final DateFormat formatter = DateFormat('ddMMM');
    return formatter.format(date);
  }

  @override
  void initState() {
    super.initState();
    //
    context.read<TicketCubit>().getMyTickets();
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
            if (state.myTicketsModel?.data?.isNotEmpty ?? false) {
              return ListView.builder(
                itemCount: state.myTicketsModel?.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  var data = state.myTicketsModel?.data?[index];
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
                        arguments: {
                          'eventId': data?.event?.id,
                          'isTicket': true
                        },
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
                              imageUrl: data?.event?.eventImage ??
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
                              text: data?.event?.title ?? 'N/A',
                              color: appColors(context).black,
                              fontWeight: FontWeight.w500,
                              size: 16.h,
                            ),
                            CustomText(
                              text: data?.event?.address ?? 'N/A',
                              color: appColors(context).gray600,
                              size: 14.h,
                              fontWeight: FontWeight.w400,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  text: formatDate(
                                      data?.event?.startDate ?? DateTime.now()),
                                  size: 14.h,
                                  color: appColors(context).gray400,
                                ),
                                CustomText(
                                  text: '-',
                                  size: 14.h,
                                  color: appColors(context).gray400,
                                ),
                                CustomText(
                                  text: formatDate(
                                      data?.event?.endDate ?? DateTime.now()),
                                  size: 14.h,
                                  color: appColors(context).gray400,
                                ),
                              ],
                            ),
                            CustomText(
                              text: data?.event?.eventCategory ?? 'N/A',
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
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  lottieLoader(
                      ctx: context, lottieAsset: LottieAssets.myTicketLottie),
                  CustomText(
                    text: 'No Tickets',
                    color: appColors(context).primary,
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
