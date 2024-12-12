import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/config/router/routers.dart';
import 'package:template/core/common/controls/custom_image_network.dart';
import 'package:template/feature/auth/data/models/login_model.dart';
import 'package:template/feature/auth/presentaion/state/login_cubit.dart';
import '../../../../core/common/controls/custom_text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          var data = state.loginData?.data?.user;
          return Column(
            children: [
              // Profile Card Section
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Profile Picture
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999)),
                      child: CustomImageNetwork(
                          imageUrl: data?.profileImage,
                          boxFit: BoxFit.cover,
                          height: 60,
                          width: 60),
                    ),

                    SizedBox(width: 16.h),

                    // User Details
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: data?.name ??
                              'N/A', // Replace with dynamic username
                          size: 18.h,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 4.h),
                        CustomText(
                          text: data?.email ??
                              'N/A', // Replace with dynamic email
                          size: 14.h,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Logout Button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.loginRoute,
                        (route) => false,
                      );
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
