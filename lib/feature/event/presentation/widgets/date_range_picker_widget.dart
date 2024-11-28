import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:template/config/themes/themeExtension/theme_extension.dart';
import 'package:template/core/common/controls/custom_button.dart';

import '../../../../core/common/controls/custom_text.dart';

class DateRangePickerWidget extends StatefulWidget {
  @override
  _DateRangePickerWidgetState createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  @override
  void initState() {
    super.initState();
    dateRange = DateTimeRange(start: DateTime.now(), end: DateTime.now());
  }

  DateTimeRange? dateRange;

  String getFrom() {
    if (dateRange == null) {
      return 'From';
    } else {
      return DateFormat('yyyy/MM/dd').format(dateRange!.start);
    }
  }

  String getUntil() {
    if (dateRange == null) {
      return 'Until';
    } else {
      return DateFormat('yyyy/MM/dd').format(dateRange!.end);
    }
  }

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(const Duration(hours: 24 * 3)),
    );
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: dateRange ?? initialDateRange,
    );

    if (newDateRange == null) return;

    setState(() => dateRange = newDateRange);
  }

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomButton(
            onTap: () {
              pickDateRange(context);
            },
            radius: 8.h,
            borderSide:
                BorderSide(color: appColors(context).gray400!, width: 1),
            color: appColors(context).bgBackground,
            width: 150.h,
            height: 40.h,
            padding: EdgeInsets.zero,
            child: CustomText(
              text: 'Select date',
              color: appColors(context).gray600,
              size: 14.h,
            ),
          ),
          Gap(16.h),
          Column(
            children: [
              CustomText(
                text: getFrom(),
                color: appColors(context).gray800,
              ),
              CustomText(
                text: getUntil(),
                color: appColors(context).gray800,
              ),
            ],
          )
        ],
      );
}
