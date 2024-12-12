import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:template/config/themes/themeExtension/theme_extension.dart';
import 'package:template/feature/event/presentation/pages/my_events.dart';
import 'package:template/feature/ticket/presentaion/pages/my_ticket.dart';

import 'package:template/feature/home/bottom_nav_bar/cubit/main_nav_cubit.dart';
import 'package:template/feature/home/page/home.dart';
import 'package:template/feature/settings/presentaion/pages/settings.dart';

import '../../../core/common/controls/custom_text.dart';
import '../../auth/data/models/login_model.dart';

class MainNavBar extends StatefulWidget {
  const MainNavBar({
    super.key,
  });

  @override
  State<MainNavBar> createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {
  var screens = [
    const HomePage(),
    MyTicket(),
    const MyEvents(),
    // const EventsPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<MainNavCubit, MainNavState>(
            builder: (context, state) {
              return Center(
                child: screens.elementAt(state.index),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50.h,
        // width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border:
                Border(top: BorderSide(color: appColors(context).gray100!))),
        alignment: Alignment.center,
        // padding: EdgeInsets.only(top: 12.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            navbarColumn(context, 0, 'Home'),
            navbarColumn(context, 1, 'MyTickets'),
            navbarColumn(context, 2, 'MyEvents'),
            navbarColumn(context, 3, 'Settings'),
          ],
        ),
      ),
    );
  }
}

Widget navbarColumn(BuildContext context, int i, String title,
    {VoidCallback? onboarding, bool? isScanFeature}) {
  return InkWell(
    onTap: (onboarding == null)
        ? () {
            context.read<MainNavCubit>().changePage(i);
          }
        : onboarding,
    child: BlocBuilder<MainNavCubit, MainNavState>(
      builder: (context, state) {
        return SizedBox(
          // width: 80.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(4.h),
              CustomText(
                text: title,
                size: 10.h,
                color: state.index == i
                    ? appColors(context).primaryBlue
                    : appColors(context).orange600,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
        );
      },
    ),
  );
}
