import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import 'package:template/config/router/routers.dart';
import 'package:template/config/themes/themeExtension/theme_extension.dart';
import 'package:template/core/common/controls/custom_button.dart';
import 'package:template/core/common/controls/custom_text.dart';
import 'package:template/core/common/controls/custom_textfield.dart';
import 'package:template/core/utils/extension.dart';
import 'package:template/feature/event/data/models/all_events_model.dart';
import 'package:template/feature/event/presentation/state/event_cubit/event_cubit.dart';
import 'package:template/feature/home/search_event_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    context.read<EventCubit>().getAllEvents();
  }

  //

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
            CustomText(
              text: 'Events',
              size: 28.h,
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
                  CustomButton(
                    radius: 16.h,
                    color: appColors(context).brandSecondary,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.searchPageRoute);
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search,
                        ),
                        Gap(8.h),
                        CustomText(
                          text: 'Search your event',
                          size: 16.h,
                          color: appColors(context).gray400,
                        )
                      ],
                    ),
                  ),
                  Gap(16.h),
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
                    return EventHomeCard(
                      singleEventData: state.allEventsModel?.data?[index],
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

class EventHomeCard extends StatelessWidget {
  const EventHomeCard({
    Key? key,
    this.singleEventData,
  }) : super(key: key);
  final Datum? singleEventData;
  String formatDate(DateTime date) {
    // Define the desired format
    final DateFormat formatter = DateFormat('MMM dd');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.eventDetailRoute,
          arguments: {'eventId': singleEventData?.id ?? 0, 'isTicket': false},
        );
      },
      child: Container(
        // height: 400,
        clipBehavior: Clip.antiAlias,
        width: 250.h,
        decoration: BoxDecoration(
            color: appColors(context).bgBackground,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                singleEventData?.eventImage ??
                    'https://vancouver.ca/images/cov/feature/crowd-hands-clapping.jpg',
                height: 150.h,
                width: 250.h,
                fit: BoxFit.cover,
              ),
            ),
            Gap(10.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.h),
                color: appColors(context).primary,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomText(
                      text: singleEventData?.eventCategory ?? 'N/A',
                      color: appColors(context).bgBackground,
                    ).addPadding(EdgeInsets.symmetric(horizontal: 15.h)),
                  ],
                ),
              ),
            ),
            Gap(4.h),
            CustomText(
              text: singleEventData?.title ?? 'N/A',
              size: 20.h,
              fontWeight: FontWeight.w500,
              color: appColors(context).gray800,
            ),
            CustomText(
              text: formatDate(singleEventData?.startDate ?? DateTime.now()),
              color: appColors(context).gray800,
              size: 12.h,
            ),
            CustomText(
              text: "At ${singleEventData?.address ?? 'N/A'}",
              color: appColors(context).gray800,
              size: 14.h,
            ),
          ],
        ).addPadding(const EdgeInsets.all(10)),
      ).addMargin(const EdgeInsets.only(
        right: 10,
      )),
    );
  }
}
