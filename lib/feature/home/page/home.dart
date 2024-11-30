import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:template/config/router/routers.dart';
import 'package:template/config/themes/themeExtension/theme_extension.dart';

import 'package:template/core/common/controls/custom_text.dart';
import 'package:template/core/common/controls/custom_textfield.dart';
import 'package:template/core/utils/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/feature/event/data/models/my_events_model.dart';
import 'package:template/feature/event/presentation/state/cubit/event_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<EventCubit>().getAllEvents();
  }

  //
  String formatDate(DateTime date) {
    // Define the desired format
    final DateFormat formatter = DateFormat('MMM dd');
    return formatter.format(date);
  }

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
    return BlocBuilder<EventCubit, EventState>(
      builder: (context, state) {
        var eventData = state.allEventsModel?.data;

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
                  state.allEventsModel?.data?.length ?? 0,
                  (index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.eventDetailRoute,
                          arguments: {
                            'eventId':
                                state.allEventsModel?.data?[index].id ?? 0,
                            'isTicket': false
                          },
                        );
                      },
                      child: Container(
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
                                eventData?[index].eventImage ??
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
                                text: eventData?[index].eventCategory ?? 'N/A',
                                color: appColors(context).bgBackground,
                              ).addPadding(
                                  EdgeInsets.symmetric(horizontal: 15.h)),
                            ),
                            Gap(4.h),
                            CustomText(
                              text: eventData?[index].title ?? 'N/A',
                              size: 20.h,
                              fontWeight: FontWeight.w500,
                              color: appColors(context).gray800,
                            ),
                            CustomText(
                              text: formatDate(eventData?[index].startDate ??
                                  DateTime.now()),
                              color: appColors(context).gray800,
                              size: 12.h,
                            ),
                            CustomText(
                              text: "At ${eventData?[index].address ?? 'N/A'}",
                              color: appColors(context).gray800,
                              size: 14.h,
                            ),
                          ],
                        ).addPadding(const EdgeInsets.all(10)),
                      ).addMargin(const EdgeInsets.only(
                        right: 10,
                      )),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
