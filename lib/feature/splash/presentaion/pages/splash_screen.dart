// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:template/core/common/loading_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initialDataFetch();
  }

  /// Perform some data fetcing and validation here
  Future<void> initialDataFetch() async {
    // Wait for 2 seconds
    await Future.delayed(const Duration(seconds: 2));
    log("SplashScreen: initialDataFetch");
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
          // User BLoC or something to check the state and navigate to the next screen accordingly
          LoadingScreen(),
    );
  }
}
