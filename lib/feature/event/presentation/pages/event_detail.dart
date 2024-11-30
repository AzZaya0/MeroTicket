import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:template/config/themes/themeExtension/theme_extension.dart';
import 'package:template/core/common/controls/custom_image_network.dart';
import 'package:template/core/common/controls/custom_text.dart';
import 'package:template/core/utils/extension.dart';

import '../../data/models/my_events_model.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({super.key, required this.eventData});
  final Datum? eventData;

  String formatDate(DateTime date) {
    // Define the desired format
    final DateFormat formatter = DateFormat('dd/MMM/yyy');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'My Event',
          color: appColors(context).black,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(18.h)),
            height: 250,
            child: CustomImageNetwork(
                imageUrl: eventData?.eventImage ?? '',
                boxFit: BoxFit.cover,
                height: 100,
                width: double.infinity),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: eventData?.title ?? '',
                size: 20.h,
                fontWeight: FontWeight.w600,
                color: appColors(context).gray800,
              ),
              Gap(16.h),
              Divider(
                color: appColors(context).gray100,
                height: 0,
              ),
              Gap(16.h),
              CustomText(
                text: 'Description',
                color: appColors(context).gray400,
                fontWeight: FontWeight.w500,
              ),
              CustomText(
                text: eventData?.description ?? '',
                color: appColors(context).gray800,
                fontWeight: FontWeight.w400,
                size: 16.h,
              ),
              Gap(16.h),
              CustomText(
                text: 'Date and Time',
                color: appColors(context).gray400,
                fontWeight: FontWeight.w500,
              ),
              Gap(8.h),
              RichText(
                text: TextSpan(
                  text: "Starts from :  ", // Default style for this part
                  style: GoogleFonts.poppins(
                    color: appColors(context).gray800,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.h,
                  ),
                  children: [
                    TextSpan(
                      text: formatDate(eventData?.startDate ??
                          DateTime.now()), // Highlight start time
                      style: GoogleFonts.poppins(
                        color: appColors(context).orange600,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.h,
                      ),
                    ),
                  ],
                ),
              ),
              // Gap(8.h),
              RichText(
                text: TextSpan(
                  text: "Ends at : ", // Default style for this part
                  style: GoogleFonts.poppins(
                    color: appColors(context).gray800,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.h,
                  ),
                  children: [
                    TextSpan(
                      text: formatDate(eventData?.endDate ??
                          DateTime.now()), // Highlight start time
                      style: GoogleFonts.poppins(
                        color: appColors(context).orange600,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.h,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(8.h),
              RichText(
                text: TextSpan(
                  text: "From ", // Default style for this part
                  style: GoogleFonts.poppins(
                    color: appColors(context).gray800,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.h,
                  ),
                  children: [
                    TextSpan(
                      text: "${eventData?.startTime}", // Highlight start time
                      style: GoogleFonts.poppins(
                        color: appColors(context).orange600,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.h,
                      ),
                    ),
                    TextSpan(
                      text: " to ", // Default style for this part
                      style: GoogleFonts.poppins(
                        color: appColors(context).gray800,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.h,
                      ),
                    ),
                    TextSpan(
                      text: "${eventData?.endTime}", // Highlight end time
                      style: GoogleFonts.poppins(
                        color: appColors(context).orange600,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.h,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(16.h),
              Divider(
                color: appColors(context).gray100,
                height: 0,
              ),
            ],
          ).addMargin(EdgeInsets.all(16.h))
        ],
      ).addMargin(EdgeInsets.all(16.h)),
    );
  }
}