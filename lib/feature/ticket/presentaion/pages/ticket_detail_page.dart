// import 'package:flutter/material.dart';
// import 'package:template/core/common/controls/custom_text.dart';

// class TicketDetailPage extends StatelessWidget {
//   const TicketDetailPage({super.key, this.eventName, this.ticketDetail});
// final String? eventName;
// final String? ticketDetail;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: CustomText(text: eventName ?? 'N/A'),
//       ),
//       body: ,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:template/config/themes/themeExtension/theme_extension.dart';
import 'package:template/core/common/controls/custom_image_network.dart';
import 'package:template/core/common/controls/custom_text.dart';
import 'package:template/feature/event/data/models/my_tickets_model.dart';

class TicketDetailPage extends StatelessWidget {
  final Event? eventData;
  final EventTicket? ticketDetail;
  final String? userTicketId;
  String formatDate(DateTime date) {
    // Define the desired format
    final DateFormat formatter = DateFormat('ddMMM');
    return formatter.format(date);
  }

  const TicketDetailPage(
      {super.key, this.eventData, this.ticketDetail, this.userTicketId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: eventData?.eventCategory ?? '',
          color: appColors(context).gray800,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Event Info
            CustomText(
              color: appColors(context).black,
              text: eventData?.title ?? "N/A",
              size: 24,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 8),
            CustomText(
                color: appColors(context).gray800,
                text:
                    "${formatDate(eventData?.startDate ?? DateTime.now())} - ${formatDate(eventData?.endDate ?? DateTime.now())} | ${eventData?.startTime} - ${eventData?.endTime}",
                size: 16.h),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                Gap(4.h),
                CustomText(
                  text: eventData?.address ?? 'N/A',
                  fontWeight: FontWeight.w400,
                  color: appColors(context).gray800,
                ),
              ],
            ),
            SizedBox(height: 20),

            // Ticket Image
            Container(
              height: 200.h,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8.h,
                  ),
                ],
              ),
              child: CustomImageNetwork(
                imageUrl: eventData?.eventImage ?? '',
                boxFit: BoxFit.cover,
                height: 200.h,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 40.h),

            // QR Code
            Column(
              children: [
                Container(
                  height: 150.h,
                  width: 150.h,
                  decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: eventData?.id != null
                        ? SizedBox(
                            height: 120.h,
                            width: 120.h,
                            child: PrettyQrView.data(
                              data: userTicketId?.toString() ?? '',
                              decoration: const PrettyQrDecoration(
                                  shape: PrettyQrSmoothSymbol()),
                            ),
                          )
                        : Icon(Icons.qr_code, size: 100, color: Colors.black54),
                  ),
                ),
                SizedBox(height: 8),
                Text("Scan this QR code at the entry"),
              ],
            ),

            Spacer(),

            // Footer Note
            CustomText(
              text: "For assistance, contact azzaya@event.com",
              color: Colors.grey,
              size: 12.h,
            ),
          ],
        ),
      ),
    );
  }
}
