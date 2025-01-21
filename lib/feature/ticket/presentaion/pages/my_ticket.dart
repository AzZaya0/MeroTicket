import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:template/config/constants/api_endpoints.dart';
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
                    padding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.h),
                    radius: 16.h,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.ticketDetailPage,
                        arguments: {
                          'eventData': data?.event,
                          'ticketData': data?.eventTicket,
                          'user_ticket_id': data?.id.toString()
                        },
                      );
                    },
                    elevation: 1.0,
                    color: appColors(context).bgBackground,
                    // shadowColor: appColors(context).gray100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Event Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.h),
                          child: CustomImageNetwork(
                            imageUrl: updateImageUrlForEmulator(data?.event?.eventImage ??
                                'https://offloadmedia.feverup.com/parissecret.com/wp-content/uploads/2023/09/06110716/Montage-photos-articles-PS-2023-12-06T110657.772-1024x683.jpg'),
                            boxFit: BoxFit.cover,
                            height: 100.h,
                            width: 100.h,
                          ),
                        ),

                        Gap(16.h),

                        // Event Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Event Title
                              CustomText(
                                text: data?.event?.title ?? 'N/A',
                                color: appColors(context).black,
                                fontWeight: FontWeight.bold,
                                size: 18.h,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),

                              // Event Address
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.h),
                                child: CustomText(
                                  text: data?.event?.address ?? 'N/A',
                                  color: appColors(context).gray600,
                                  size: 14.h,
                                  fontWeight: FontWeight.w400,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              // Date Range
                              Row(
                                children: [
                                  Icon(Icons.calendar_today,
                                      size: 14.h,
                                      color: appColors(context).gray400),
                                  Gap(6.h),
                                  CustomText(
                                    text:
                                        '${formatDate(data?.event?.startDate ?? DateTime.now())} - ${formatDate(data?.event?.endDate ?? DateTime.now())}',
                                    size: 14.h,
                                    color: appColors(context).gray400,
                                  ),
                                ],
                              ),

                              // Event Category
                              Padding(
                                padding: EdgeInsets.only(top: 6.h),
                                child: CustomText(
                                  text: data?.event?.eventCategory ?? 'N/A',
                                  size: 12.h,
                                  color: appColors(context).orange600,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).addMargin(
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.h));
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
