import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SvgAssets {
  static String svgBasePath = 'resources/svg_icons';
  static String profilePlaceholder =
      '$svgBasePath/commons/profile_placeholder.svg';
  static String logoutModuleEyeClosed =
      '$svgBasePath/commons/logout_module_eye_closed.svg';
  static String logoutModuleEye = '$svgBasePath/commons/logout_module_eye.svg';
}

class PngAssets {
  static String pngBasePath = 'resources/images';

  static String profileBackground = "$pngBasePath/profile_background.png";
}

class LottieAssets {
  static String lottieBasePath = 'resources/lottie';

  static String createEventjson = "$lottieBasePath/create_event.json";
  static String createEventLottie = "$lottieBasePath/create_event.lottie";
  static String myTicketLottie = "$lottieBasePath/my_ticketss.lottie";
  static String ticketLoadingLottie = "$lottieBasePath/ticket_loading.lottie";
}

class NetworkAssets {
  static String pngBasePath =
      'https://i.pinimg.com/564x/b3/17/f3/b317f39796d1974de83f01f4ffeb32c3.jpg';
}

DotLottieLoader lottieLoader(
    {required BuildContext ctx,
    required String lottieAsset,
    double? height,
    BoxFit? fit,
    double? width}) {
  return DotLottieLoader.fromAsset(lottieAsset,
      frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
    if (dotlottie != null) {
      return Lottie.memory(dotlottie.animations.values.single,
          fit: fit, height: height, width: width);
    } else {
      return Container();
    }
  });
}
