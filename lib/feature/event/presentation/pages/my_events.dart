import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:template/config/constants/asset_manager.dart';
import 'package:template/config/router/routers.dart';
import 'package:template/config/themes/themeExtension/theme_extension.dart';
import 'package:template/core/app.dart';
import 'package:template/core/common/controls/custom_button.dart';
import 'package:template/core/common/controls/custom_image_network.dart';
import 'package:template/core/common/controls/custom_text.dart';
import 'package:template/core/utils/extension.dart';
import 'package:template/feature/event/presentation/state/cubit/event_cubit.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({super.key});

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  @override
  void initState() {
    context.read<EventCubit>().getMyEvents();
    super.initState();
  }

  String formatDate(DateTime date) {
    // Define the desired format
    final DateFormat formatter = DateFormat('ddMMM');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: appColors(context).bgBackground,
      body: BlocBuilder<EventCubit, EventState>(
        builder: (context, state) {
          // if (false) {
          if (state.myEventsModel != null &&
              ((state.myEventsModel?.data?.isNotEmpty) ?? false)) {
            return ListView.builder(
              itemCount: state.myEventsModel?.data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                var eventData = state.myEventsModel?.data?[index];
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
                        'eventData': eventData,
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
                            imageUrl: eventData?.eventImage ?? '',
                            boxFit: BoxFit.cover,
                            height: 100.h,
                            width: 90.h),
                      ),
                      Gap(16.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: eventData?.title ?? '',
                            color: appColors(context).black,
                            fontWeight: FontWeight.w500,
                            size: 16.h,
                          ),
                          CustomText(
                            text: eventData?.address ?? '',
                            color: appColors(context).gray600,
                            size: 14.h,
                            fontWeight: FontWeight.w400,
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: formatDate(
                                    eventData?.startDate ?? DateTime.now()),
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
                                    eventData?.endDate ?? DateTime.now()),
                                size: 14.h,
                                color: appColors(context).gray400,
                              ),
                              SizedBox(
                                height: 30,
                                width: 40,
                                child: Stack(
                                  children: [
                                    ...List.generate(
                                      eventData?.vendors?.length ?? 0,
                                      (vendorIndex) {
                                        return Positioned(
                                          right: vendorIndex * (20.h / 1.5),
                                          child: Container(
                                            margin: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: appColors(context)
                                                        .brandSecondary!),
                                                borderRadius:
                                                    BorderRadius.circular(300)),
                                            child: CustomImageNetwork(
                                                imageUrl: state
                                                        .myEventsModel
                                                        ?.data?[index]
                                                        .vendors?[vendorIndex]
                                                        .venders
                                                        ?.profileImage ??
                                                    '',
                                                boxFit: BoxFit.cover,
                                                height: 20.h,
                                                width: 20.h),
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
                            text: eventData?.eventCategory ?? '',
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
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.newEventRoute);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    lottieLoader(
                        ctx: context,
                        lottieAsset: LottieAssets.createEventLottie),
                    CustomText(
                      text: 'Tap to Create One',
                      color: appColors(context).primary,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
