import 'package:flutter/material.dart';

import '../../config/constants/constants.dart';

void kShowSnackBar({
  required String message,
  BuildContext? context,
  GlobalKey<ScaffoldState>? scaffoldKey,
  Duration duration = const Duration(milliseconds: 1200),
  Color color = KColors.offWhiteColor,
}) {
  if (context != null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        elevation: 2,
        content: Text(
          message,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: KColors.blackColor,
              ),
        ),
        duration: duration,
      ),
    );
  } else {
    ScaffoldMessenger.of(scaffoldKey!.currentContext!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        elevation: 2,
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
            color: KColors.blackColor,
          ),
        ),
        duration: duration,
      ),
    );
  }
}
