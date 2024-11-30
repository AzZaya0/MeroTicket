import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:template/config/themes/themeExtension/theme_extension.dart';
import 'package:template/core/common/controls/custom_button.dart';

import 'package:template/core/common/controls/custom_text.dart';
import 'package:template/core/common/controls/custom_textfield.dart';
import 'package:template/core/common/controls/pick_image/image_picker_cubit.dart';
import 'package:template/core/utils/extension.dart';
import 'package:template/feature/auth/presentaion/state/login_cubit.dart';
import 'package:template/feature/event/presentation/state/event_cubit/event_cubit.dart';
import 'package:template/feature/event/presentation/widgets/date_range_picker_widget.dart';
import 'package:template/feature/event/presentation/widgets/search_vendor_widget.dart';
import 'package:template/feature/event/presentation/widgets/time_picker_widget.dart';

class NewEventPage extends StatefulWidget {
  const NewEventPage({super.key});

  @override
  State<NewEventPage> createState() => _NewEventPageState();
}

class _NewEventPageState extends State<NewEventPage> {
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController addressController;
  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController();
    nameController = TextEditingController();
    addressController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    nameController.dispose();
    descriptionController.dispose();
    addressController.dispose();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    print(args.value);
  }

  File? imageFile;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return CustomButton(
            radius: 8.h,
            color: appColors(context).primary,
            onTap: () {
              context.read<EventCubit>().createEvent(
                    category: state.categoryNameList?.first ?? '',
                    context: context,
                    title: nameController.text.trim().toString(),
                    eventImage: imageFile,
                    address: addressController.text.trim().toString(),
                    description: descriptionController.text.trim().toString(),
                  );
            },
            child: CustomText(
              text: 'Create',
              color: appColors(context).bgBackground,
            ),
          );
        },
      ).addMargin(EdgeInsets.all(8.h)),
      appBar: AppBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Create Event',
                  color: appColors(context).black,
                  size: 18.h,
                  fontWeight: FontWeight.w600,
                ),
                Gap(8.h),
                Container(
                  padding: EdgeInsets.all(8.h),
                  decoration: BoxDecoration(
                      color: appColors(context).gray100,
                      borderRadius: BorderRadius.circular(8.h)),
                  child: Row(
                    children: [
                      CustomButton(
                        height: 40.h,
                        radius: 8.h,
                        width: 200.h,
                        padding: const EdgeInsets.all(0),
                        color: appColors(context).gray400,
                        onTap: () async {
                          var file = await context
                              .read<ImagePickerCubit>()
                              .getImage(context: context);

                          if (file != null) {
                            imageFile = null;
                            imageFile = await context
                                .read<ImagePickerCubit>()
                                .compressImage(file);
                          }
                          setState(() {});
                        },
                        overlayColor: appColors(context).gray600,
                        child: CustomText(
                          text: 'Choose Event Image',
                          color: Colors.white,
                          size: 16.h,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      (imageFile != null)
                          ? Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.h)),
                              child: Image.file(
                                imageFile!,
                                height: 100.h,
                                width: 100.h,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                Gap(16.h),
                Container(
                  decoration: BoxDecoration(
                      color: appColors(context).gray100,
                      borderRadius: BorderRadius.circular(8.h)),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(8.h),
                      CustomText(
                        text: 'Name of the event',
                        color: appColors(context).gray800,
                        size: 14.h,
                        fontWeight: FontWeight.w400,
                      ),
                      Gap(4.h),
                      CustomTextField(
                        hintText: 'Enter',
                        hintColor: appColors(context).gray400,
                        maxLines: 1,
                        expands: false,
                        controller: nameController,
                        filledColor: appColors(context).bgBackground,
                      ),
                      Gap(8.h),
                      CustomText(
                        text: 'Description',
                        color: appColors(context).gray800,
                        size: 14.h,
                        fontWeight: FontWeight.w400,
                      ),
                      Gap(4.h),
                      CustomTextField(
                        hintText: 'Enter',
                        hintColor: appColors(context).gray400,
                        minLines: 5,
                        controller: descriptionController,
                        filledColor: appColors(context).bgBackground,
                      ),
                      Gap(8.h),
                      CustomText(
                        text: 'Address',
                        color: appColors(context).gray800,
                        size: 14.h,
                        fontWeight: FontWeight.w400,
                      ),
                      Gap(4.h),
                      CustomTextField(
                        hintText: 'Enter',
                        hintColor: appColors(context).gray400,
                        maxLines: 1,
                        expands: false,
                        controller: addressController,
                        filledColor: appColors(context).bgBackground,
                      ),
                    ],
                  ).addMargin(EdgeInsets.all(8.h)),
                ),
                Gap(16.h),
                Container(
                  padding: EdgeInsets.all(8.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: appColors(context).gray100,
                      borderRadius: BorderRadius.circular(8.h)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Organization Category',
                        size: 14.h,
                        fontWeight: FontWeight.w500,
                        color: appColors(context).gray800,
                      ),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          return Wrap(
                            children: [
                              ...List.generate(
                                state.organizationCategoryModel?.data?.length ??
                                    0,
                                (index) {
                                  return InkWell(
                                    onTap: () {
                                      context
                                          .read<LoginCubit>()
                                          .addNameToCategory(state
                                                  .organizationCategoryModel
                                                  ?.data?[index] ??
                                              '');
                                      // setState(() {});
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(4.h),
                                      padding: EdgeInsets.all(4.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.h),
                                        color: (state.categoryNameList ?? [''])
                                                .contains(state
                                                        .organizationCategoryModel
                                                        ?.data?[index] ??
                                                    '')
                                            ? appColors(context).primary
                                            : appColors(context).bgBackground,
                                      ),
                                      child: CustomText(
                                        text: state.organizationCategoryModel
                                                ?.data?[index] ??
                                            '',
                                        size: 14.h,
                                        fontWeight: FontWeight.w500,
                                        color: (state.categoryNameList ?? [''])
                                                .contains(state
                                                        .organizationCategoryModel
                                                        ?.data?[index] ??
                                                    '')
                                            ? appColors(context).brandSecondary
                                            : appColors(context).gray800,
                                      ),
                                    ),
                                  );
                                },
                              )
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Gap(16.h),
                Container(
                  decoration: BoxDecoration(
                      color: appColors(context).gray100,
                      borderRadius: BorderRadius.circular(8.h)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Date & Time of event ',
                        color: appColors(context).gray800,
                        size: 14.h,
                        fontWeight: FontWeight.w400,
                      ),
                      Gap(4.h),
                      DateRangePickerWidget(),
                      TimePickerWidget()
                    ],
                  ).addMargin(EdgeInsets.all(8.h)),
                ),
                Gap(16.h),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: appColors(context).gray100,
                      borderRadius: BorderRadius.circular(8.h)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Ticket prices & types',
                        color: appColors(context).gray800,
                        size: 16.h,
                        fontWeight: FontWeight.w400,
                      ),
                      Gap(16.h),
                      BlocBuilder<EventCubit, EventState>(
                        builder: (context, state) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.ticketType?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 16.h),
                                decoration: BoxDecoration(
                                    color: appColors(context).brandSecondary,
                                    borderRadius: BorderRadius.circular(8.h)),
                                child: Row(
                                  children: [
                                    Gap(10.h),
                                    CustomText(
                                      text: state
                                              .ticketType?[index]?.ticketType ??
                                          '',
                                      color: appColors(context).gray600,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    const Spacer(),
                                    CustomText(
                                      text:
                                          "RS ${state.ticketType?[index]?.ticketPrice ?? ''}",
                                      color: appColors(context).gray600,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          context
                                              .read<EventCubit>()
                                              .deleteTicket(
                                                  state.ticketType?[index]);
                                        },
                                        icon: Icon(Icons.delete))
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                      //
                      CustomButton(
                        elevation: 0,
                        onTap: () {
////

                          void showModernTicketInputDialog(
                              BuildContext context) {
                            final TextEditingController ticketTypeController =
                                TextEditingController();
                            final TextEditingController ticketPriceController =
                                TextEditingController();

                            showDialog(
                              context: context,
                              barrierDismissible:
                                  false, // Prevent dismissing on background tap
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        20), // Rounded corners
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomText(
                                          text: 'Enter Ticket Details',
                                          size: 20.h,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        SizedBox(height: 20.h),
                                        TextField(
                                          controller: ticketTypeController,
                                          decoration: InputDecoration(
                                            labelText: 'Ticket Type',
                                            hintText: 'Eg.. Basic',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 16.h,
                                              vertical: 12.h,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 15.h),
                                        TextField(
                                          controller: ticketPriceController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            labelText: 'Ticket Price',
                                            hintText: 'Enter ticket price',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 16.h,
                                              vertical: 12.h,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              style: TextButton.styleFrom(
                                                foregroundColor:
                                                    Colors.redAccent,
                                              ),
                                              child: CustomText(
                                                text: 'Cancel',
                                                size: 16.h,
                                                color:
                                                    appColors(context).gray600,
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                String ticketType =
                                                    ticketTypeController.text;
                                                String ticketPrice =
                                                    ticketPriceController.text;

                                                if (ticketType.isEmpty ||
                                                    ticketPrice.isEmpty) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                          'Please fill in all fields'),
                                                      backgroundColor:
                                                          Colors.redAccent,
                                                    ),
                                                  );
                                                  return;
                                                }

                                                // Use the input values here
                                                print(
                                                    'Ticket Type: $ticketType');
                                                print(
                                                    'Ticket Price: $ticketPrice');
                                                context
                                                    .read<EventCubit>()
                                                    .addTicket(TicketType(
                                                        ticketType: ticketType,
                                                        ticketPrice:
                                                            ticketPrice));
                                                // Close the dialog
                                                Navigator.of(context).pop();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    appColors(context).primary,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              child: CustomText(
                                                text: 'Submit',
                                                size: 16.h,
                                                color: appColors(context)
                                                    .brandSecondary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }

                          showModernTicketInputDialog(context);
//////
                        },
                        height: 40.h,
                        color: appColors(context).brandSecondary,
                        radius: 8.h,
                        width: double.infinity,
                        child: CustomText(
                          text: '+TicketType',
                          color: appColors(context).gray400,
                        ),
                      )
                    ],
                  ).addMargin(EdgeInsets.all(8.h)),
                ),
                Gap(16.h),
                Container(
                  decoration: BoxDecoration(
                      color: appColors(context).gray100,
                      borderRadius: BorderRadius.circular(8.h)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Add Vendor',
                        color: appColors(context).gray800,
                        size: 16.h,
                        fontWeight: FontWeight.w500,
                      ),
                      Gap(4.h),
                      SearchWithAttachedSuggestions(),
                      Gap(8.h),
                      BlocBuilder<EventCubit, EventState>(
                        builder: (context, state) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.selectedVendors?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 80.h,
                                width: 150.h,
                                padding: EdgeInsets.all(8.h),
                                margin: EdgeInsets.only(bottom: 8.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.h),
                                    color: appColors(context).bgBackground),
                                child: Row(
                                  children: [
                                    Gap(8.h),
                                    const CircleAvatar(),
                                    Gap(8.h),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: state.selectedVendors?[index]
                                                  .name ??
                                              '',
                                          color: appColors(context).gray800,
                                          size: 14.h,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        CustomText(
                                          text: 'Location',
                                          color: appColors(context).gray800,
                                          size: 12.h,
                                        ),
                                        CustomText(
                                          text: 'Category',
                                          color: appColors(context).gray800,
                                          size: 12.h,
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        context
                                            .read<EventCubit>()
                                            .removeVendorFromList(
                                                state.selectedVendors?[index]);
                                      },
                                      color: appColors(context).orange600,
                                    ),
                                    Gap(8.h),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ).addMargin(EdgeInsets.all(8.h)),
                )
              ],
            ).addMargin(EdgeInsets.all(16.h)),
          ),
        ),
      ),
    );
  }
}
