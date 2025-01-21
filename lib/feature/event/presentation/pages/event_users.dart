import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/common/controls/custom_image_network.dart';

import 'package:template/core/common/controls/custom_text.dart';
import 'package:template/core/utils/extension.dart';
import 'package:template/feature/event/presentation/state/event_cubit/event_cubit.dart';

class EventUsersPage extends StatefulWidget {
  const EventUsersPage({
    Key? key,
    this.eventId,
  }) : super(key: key);
  final int? eventId;
  @override
  State<EventUsersPage> createState() => _EventUsersPageState();
}

class _EventUsersPageState extends State<EventUsersPage> {
  @override
  void initState() {
    context.read<EventCubit>().getEventUsers(eventId: widget.eventId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Event participation's ",
        ),
      ),
      body: Column(
        children: [
          BlocBuilder<EventCubit, EventState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.eventUserModel?.data?.length ?? 0,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  var userData = state.eventUserModel?.data?[index].eventUsers;
                  return Container(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Profile Picture
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(999)),
                          child: CustomImageNetwork(
                              imageUrl: (userData?.profileImage),
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
                              text: userData?.name ??
                                  'N/A', // Replace with dynamic username
                              size: 18.h,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(height: 4.h),
                            CustomText(
                              text: userData?.email ??
                                  'N/A', // Replace with dynamic email
                              size: 14.h,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 4.h),
                            CustomText(
                              text: userData?.phone ??
                                  'N/A', // Replace with dynamic email
                              size: 14.h,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 4.h),
                            CustomText(
                              text: userData?.address ??
                                  'N/A', // Replace with dynamic email
                              size: 14.h,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ).addMargin(EdgeInsets.all(16.h)),
        ],
      ),
    );
  }
}
