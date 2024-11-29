import 'package:flutter/material.dart';
import 'package:template/config/router/routers.dart';
import 'package:template/core/common/custom_snackbar.dart';

import '../../../../core/common/controls/custom_text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          onTap: () {
      
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.loginRoute, (route) => false);
          },
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [CustomText(text: 'Settings')],
          ),
        ),
      ),
    );
  }
}
