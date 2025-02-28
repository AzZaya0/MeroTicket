import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import 'package:template/config/constants/api_endpoints.dart';
import 'package:template/config/router/routers.dart';
// import 'package:flutter_haptic/flutter_haptic.dart';
import 'package:template/config/themes/themeExtension/theme_extension.dart';
import 'package:template/core/common/controls/custom_button.dart';
import 'package:template/core/common/controls/custom_button_sheet.dart';
import 'package:template/core/common/controls/custom_image_network.dart';
import 'package:template/core/common/controls/custom_text.dart';
import 'package:template/core/utils/extension.dart';
import 'package:template/feature/event/presentation/state/event_cubit/event_cubit.dart';

class EventDetail extends StatefulWidget {
  const EventDetail({super.key, this.eventId, this.isTicket, this.viewTicket});

  final int? eventId;
  final bool? isTicket;
  final bool? viewTicket;

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  String formatDate(DateTime date) {
    // Define the desired format
    final DateFormat formatter = DateFormat('dd/MMM/yyy');
    return formatter.format(date);
  }

  @override
  void initState() {
    super.initState();
    context.read<EventCubit>().getEventById(eventId: widget.eventId);
  }

  final pageIndexNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventCubit, EventState>(builder: (context, state) {
      var eventData = state.getEventById?.data;
      return Scaffold(
          bottomNavigationBar: (widget.viewTicket ?? true)
              ? (widget.isTicket ?? false)
                  ? SizedBox()
                  : Container(
                      color: appColors(context).brandSecondary,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Gap(30.h),
                          CustomText(
                            text: '',
                            color: appColors(context).black,
                            fontWeight: FontWeight.w600,
                          ),
                          Spacer(),
                          CustomButton(
                            radius: 14.h,
                            width: 200.h,
                            color: appColors(context).primary,
                            onTap: () {
                              ShowCustomBottomSheet().showBottomSheetsNew(
                                  pageIndexNotifier: pageIndexNotifier,
                                  eventTickets: eventData?.eventTickets,
                                  eventId: eventData?.id,
                                  context: context);
                            },
                            child: CustomText(
                              text: 'View Ticket',
                              fontWeight: FontWeight.w600,
                              color: appColors(context).brandSecondary,
                            ),
                          ),
                        ],
                      ).addMargin(EdgeInsets.all(8.h)),
                    )
              : null,
          appBar: AppBar(
            title: CustomText(
              text: eventData?.title ?? 'N/A',
              color: appColors(context).black,
              fontWeight: FontWeight.w600,
            ),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.h)),
                    height: 100.h,
                    width: 100.h,
                    child: CustomImageNetwork(
                        imageUrl: updateImageUrlForEmulator(
                            state.getEventById?.data?.eventImage ?? ''),
                        boxFit: BoxFit.cover,
                        height: 100.h,
                        width: double.infinity),
                  ),
                  Gap(16.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(16.h),
                      CustomText(
                        text: 'Date and Time',
                        color: appColors(context).gray400,
                        fontWeight: FontWeight.w500,
                      ),
                      Gap(8.h),
                      RichText(
                        text: TextSpan(
                          text:
                              "Starts from :  ", // Default style for this part
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
                              text:
                                  "${eventData?.startTime}", // Highlight start time
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
                              text:
                                  "${eventData?.endTime}", // Highlight end time
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
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  Divider(
                    color: appColors(context).gray100,
                    height: 0,
                  ),
                ],
              ).addMargin(EdgeInsets.all(16.h)),
              (widget.isTicket ?? false)
                  ? Column(
                      children: [
                        SizedBox(
                          height: 200,
                          child: QRCodeDartScanView(
                            scanInvertedQRCode:
                                true, // enable scan invert qr code ( default = false)

                            typeScan: TypeScan
                                .live, // if TypeScan.takePicture will try decode when click to take a picture(default TypeScan.live)
                            intervalScan: const Duration(seconds: 2)
                            // onResultInterceptor: (old,new){
                            //  do any rule to controll onCapture.
                            // }
                            // takePictureButtonBuilder: (context,controller,isLoading){ // if typeScan == TypeScan.takePicture you can customize the button.
                            //    if(loading) return CircularProgressIndicator();
                            //    return ElevatedButton(
                            //       onPressed:controller.takePictureAndDecode,
                            //       child:Text('Take a picture'),
                            //    );
                            // }
                            // resolutionPreset: = QrCodeDartScanResolutionPreset.high,
                            // formats: [ // You can restrict specific formats.
                            //  BarcodeFormat.qrCode,
                            //  BarcodeFormat.aztec,
                            //  BarcodeFormat.dataMatrix,
                            //  BarcodeFormat.pdf417,
                            //  BarcodeFormat.code39,
                            //  BarcodeFormat.code93,
                            //  BarcodeFormat.code128,
                            //  BarcodeFormat.ean8,
                            //  BarcodeFormat.ean13,
                            // ],,
                            ,
                            onCapture: (Result result) async {
                              await Haptics.vibrate(HapticsType.success);
                              print(result.text);
                              context.read<EventCubit>().scanTicket(
                                  ticketId: result.text, context: context);
                            },
                          ),
                        ),
                        Gap(20.h),
                        CustomText(text: 'Scan Ticket Here')
                      ],
                    )
                  : SizedBox(),
              Gap(50.h),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.eventUsersPage,
                      arguments: {
                        'eventId': widget.eventId ?? 0,
                      },
                    );
                  },
                  title: CustomText(
                    text: "View participation's",
                    color: appColors(context).black,
                  ),
                ),
              )
            ],
          ).addMargin(EdgeInsets.all(16.h)));
    });
  }
}
