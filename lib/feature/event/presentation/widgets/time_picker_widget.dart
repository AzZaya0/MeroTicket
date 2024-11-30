import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:template/core/app.dart';
import 'package:template/core/common/controls/custom_button.dart';
import 'package:template/feature/event/presentation/state/event_cubit/event_cubit.dart';

import '../../../../config/themes/themeExtension/theme_extension.dart';
import '../../../../core/common/controls/custom_text.dart';

class TimePickerWidget extends StatefulWidget {
  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  late TimeOfDay? startTime;
  late TimeOfDay? endTime;

  @override
  void initState() {
    super.initState();
    startTime = TimeOfDay.now();
    endTime = TimeOfDay.now();
  }

  String getText(TimeOfDay? time) {
    if (time == null) {
      return 'Select Time';
    } else {
      final hours = time.hour.toString().padLeft(2, '0');
      final minutes = time.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            children: [
              CustomButton(
                radius: 8.h,
                borderSide:
                    BorderSide(color: appColors(context).gray400!, width: 1),
                color: appColors(context).bgBackground,
                width: 150.h,
                height: 40.h,
                padding: EdgeInsets.zero,
                child: CustomText(
                  text: 'Select Start Time',
                  color: appColors(context).gray600,
                  size: 14.h,
                ),
                // text: getText(),
                onTap: () => pickStartTime(context, startTime, true),
              ),
              Gap(16.h),
              CustomText(
                text: getText(startTime),
                color: appColors(context).gray800,
              )
            ],
          ),
          Row(
            children: [
              CustomButton(
                radius: 8.h,
                borderSide:
                    BorderSide(color: appColors(context).gray400!, width: 1),
                color: appColors(context).bgBackground,
                width: 150.h,
                height: 40.h,
                padding: EdgeInsets.zero,
                child: CustomText(
                  text: 'Select Tnd Time',
                  color: appColors(context).gray600,
                  size: 14.h,
                ),
                // text: getText(),
                onTap: () => pickStartTime(context, endTime, false),
              ),
              Gap(16.h),
              CustomText(
                text: getText(endTime),
                color: appColors(context).gray800,
              )
            ],
          )
        ],
      );

  Future pickStartTime(
      BuildContext context, TimeOfDay? time, bool isStart) async {
    const initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? initialTime,
    );

    if (newTime == null) return;
    context.read<EventCubit>().setTime(isStart, newTime);
    isStart
        ? setState(() => startTime = newTime)
        : setState(() => endTime = newTime);
  }
}
