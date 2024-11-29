import 'package:flutter/material.dart';
import 'package:template/config/constants/asset_manager.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: lottieLoader(
          ctx: context,
          lottieAsset: LottieAssets.ticketLoadingLottie,
          fit: BoxFit.fitHeight,
          height: 200),
    );
  }
}
