import 'package:flutter/material.dart';
import 'package:template/core/common/controls/custom_text.dart';

import '../../../../config/constants/asset_manager.dart';
import '../../../../config/themes/themeExtension/theme_extension.dart';

class MyTicket extends StatelessWidget {
  const MyTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            lottieLoader(
                ctx: context, lottieAsset: LottieAssets.myTicketLottie),
            CustomText(
              text: 'No Tickets',
              color: appColors(context).primary,
            ),
          ],
        ),
      ),
    );
  }
}
