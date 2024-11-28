import 'package:flutter/material.dart';
import 'package:template/config/constants/asset_manager.dart';
import 'package:template/config/router/routers.dart';
import 'package:template/config/themes/themeExtension/theme_extension.dart';
import 'package:template/core/common/controls/custom_text.dart';

class MyEvents extends StatelessWidget {
  const MyEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.newEventRoute);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lottieLoader(
                  ctx: context, lottieAsset: LottieAssets.createEventLottie),
              CustomText(
                text: 'Create One',
                color: appColors(context).primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
