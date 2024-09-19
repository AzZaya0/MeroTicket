import 'package:flutter/material.dart';

import '../../config/constants/constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: KColors.blackColor,
        color: KColors.accentColor,
      ),
    );
  }
}
