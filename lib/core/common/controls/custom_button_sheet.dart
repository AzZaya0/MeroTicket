import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/feature/event/data/models/get_event_by_id.dart';
import 'package:template/feature/event/presentation/widgets/payment_bottom_sheet.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class ShowCustomBottomSheet {
  final double _pageBreakpoint = 768.0;
  void showBottomSheetsNew(
      {required ValueNotifier<int> pageIndexNotifier,
      required BuildContext context,
      List<EventTicket>? eventTickets}) async {
    // await Future.delayed(Duration(seconds: 1));

    WoltModalSheet.show<void>(
      pageIndexNotifier: pageIndexNotifier,
      barrierDismissible: true,
      enableDrag: true,
      context: context,
      useSafeArea: true,
      pageListBuilder: (modalSheetContext) {
        nextPage() {
          pageIndexNotifier.value = pageIndexNotifier.value + 1;
        }

        prevPage() {
          pageIndexNotifier.value = pageIndexNotifier.value - 1;
        }

        return [
          BottomSheetPages().firstPage(
              context: context, nextPage: nextPage, eventTickets: eventTickets),
          BottomSheetPages().secondPage(context: context, previous: prevPage),
        ];
      },
      modalTypeBuilder: (context) {
        final size = MediaQuery.sizeOf(context).width;
        if (size < _pageBreakpoint) {
          return WoltModalType.bottomSheet;
        } else {
          return WoltModalType.dialog;
        }
      },
      onModalDismissedWithBarrierTap: () {
        debugPrint('Closed modal sheet with barrier tap');
        Navigator.of(context).pop();
      },
      maxDialogWidth: 620.h,
      minDialogWidth: 400,
      minPageHeight: 0.0,
      maxPageHeight: 0.9,
    );
  }
}
