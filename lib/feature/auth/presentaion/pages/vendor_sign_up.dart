import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:template/config/themes/themeExtension/theme_extension.dart';
import 'package:template/core/common/controls/pick_image/image_picker_cubit.dart';
import 'package:template/core/utils/extension.dart';

import '../../../../core/common/controls/custom_button.dart';
import '../../../../core/common/controls/custom_text.dart';
import '../../../../core/common/controls/custom_textfield.dart';
import '../state/login_cubit.dart';

class VendorSignUp extends StatefulWidget {
  const VendorSignUp({super.key});

  @override
  State<VendorSignUp> createState() => _VendorSignUpState();
}

class _VendorSignUpState extends State<VendorSignUp> {
  late TextEditingController nameController;
  late TextEditingController ownerNameController;
  late TextEditingController addressController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController confirmPassController;
  @override
  void initState() {
    nameController = TextEditingController();
    ownerNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    passwordController = TextEditingController();
    confirmPassController = TextEditingController();
    // checkLogin(context);
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors(context).gray100,
      appBar: AppBar(
        backgroundColor: appColors(context).gray100,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                topTitlesSection(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(30.h),
                    Row(
                      children: [
                        (imageFile != null)
                            ? Image.file(
                                imageFile!,
                                height: 100.h,
                                width: 100.h,
                              )
                            : Container(),
                        Gap(16.h),
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
                            text: 'SelectImage',
                            color: Colors.white,
                            size: 16.h,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Gap(16.h),
                    SignUpTextfieldSection(
                        title: 'Institution Name',
                        textInputType: TextInputType.phone,
                        hintText: "Enter your Institution Name",
                        validator: (value) {
                          if (value?.trim().isEmpty ?? false) {
                            return "Please enter your Institution Name!";
                          } else {
                            return null;
                          }
                        },
                        controller: nameController),
                    Gap(16.h),
                    SignUpTextfieldSection(
                        title: 'Owner Name',
                        textInputType: TextInputType.phone,
                        hintText: "Enter your Owner Name",
                        validator: (value) {
                          if (value?.trim().isEmpty ?? false) {
                            return "Please enter your Institution Name!";
                          } else {
                            return null;
                          }
                        },
                        controller: ownerNameController),
                    Gap(16.h),
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
                                      borderRadius: BorderRadius.circular(10.h),
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

                    ///

                    ///
                    Gap(16.h),
                    SignUpTextfieldSection(
                        title: 'Email',
                        textInputType: TextInputType.emailAddress,
                        hintText: "Enter your Email",
                        validator: (value) {
                          if (value?.trim().isEmpty ?? false) {
                            return "Please enter your Email!";
                          } else {
                            return null;
                          }
                        },
                        controller: emailController),
                    Gap(16.h),
                    SignUpTextfieldSection(
                        title: 'Phone',
                        textInputType: TextInputType.phone,
                        hintText: "Enter your phone",
                        validator: (value) {
                          if (value?.trim().isEmpty ?? false) {
                            return "Please enter your phone number!";
                          } else {
                            return null;
                          }
                        },
                        controller: phoneController),
                    Gap(16.h),
                    SignUpTextfieldSection(
                        title: 'Address',
                        textInputType: TextInputType.emailAddress,
                        hintText: "Enter your address",
                        validator: (value) {
                          if (value?.trim().isEmpty ?? false) {
                            return "Please enter your address!";
                          } else {
                            return null;
                          }
                        },
                        controller: addressController),
                    Gap(16.h),
                    SignUpTextfieldSection(
                        title: 'Password',
                        hintText: "Enter your password",
                        validator: (value) {
                          if (value?.trim().isEmpty ?? false) {
                            return "Please enter your password!";
                          } else {
                            return null;
                          }
                        },
                        isPasswordField: true,
                        controller: passwordController),
                    Gap(16.h),
                    SignUpTextfieldSection(
                        title: 'Confirm Password',
                        hintText: "Enter your password",
                        validator: (value) {
                          if (value?.trim().isEmpty ?? false) {
                            return "Please enter your password!";
                          } else {
                            return null;
                          }
                        },
                        isPasswordField: true,
                        controller: confirmPassController),
                    ButtonSection(
                      emailController: emailController,
                      passwordController: passwordController,
                      formKey: _formKey,
                      ownerNameController: ownerNameController,
                      companyNameController: nameController,
                      addressController: addressController,
                      phoneController: phoneController,
                      confirmPassController: confirmPassController,
                      imageFile: imageFile,
                    )
                  ],
                ),
              ],
            ).addMargin(EdgeInsets.all(16.h)),
          ),
        ),
      ),
    );
  }

  Widget topTitlesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Vendor Sign UP ",
          size: 36.h,
          color: appColors(context).gray800,
          fontWeight: FontWeight.w600,
        ),
        // Gap(12.h),
        CustomText(
          text: "Let’s Sign you Up.",
          size: 14.h,
          color: appColors(context).gray800,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}

class SignUpTextfieldSection extends StatelessWidget {
  const SignUpTextfieldSection({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.isPasswordField = false,
    this.textInputType,
    this.validator,
  });

  final String title;
  final String hintText;
  final TextEditingController controller;
  final bool isPasswordField;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomText(
        text: title,
        size: 14.h,
        fontWeight: FontWeight.w500,
        color: appColors(context).gray800,
      ),
      Gap(4.h),
      CustomTextField(
        validator: validator,
        isPasswordField: isPasswordField,
        hintText: hintText,
        keyboardType: textInputType,
        controller: controller,
        borderSide: BorderSide.none,
        hintColor: appColors(context).gray400,
      )
    ]);
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.companyNameController,
    required this.ownerNameController,
    required this.addressController,
    required this.phoneController,
    required this.confirmPassController,
    this.imageFile,
  }) : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState>? formKey;

  final TextEditingController companyNameController;
  final TextEditingController ownerNameController;
  final TextEditingController addressController;
  final TextEditingController phoneController;
  final TextEditingController confirmPassController;
  final File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return CustomButton(
              height: 40.h,
              radius: 8.h,
              width: double.infinity,
              padding: const EdgeInsets.all(0),
              color: const Color(0xff2656FF),
              onTap: () {
                if (formKey?.currentState?.validate() ?? false) {
                  // compressImage
                  if (imageFile != null) {
                    context.read<LoginCubit>().createVendorAccount(
                        context: context,
                        name: ownerNameController.text.toString(),
                        email: emailController.text.toString(),
                        companyLogo: imageFile!,
                        organizationName: companyNameController.text.toString(),
                        organizationCategory: context
                                .read<LoginCubit>()
                                .state
                                .categoryNameList
                                ?.first ??
                            '',
                        phone: phoneController.text.toString(),
                        password: passwordController.text.toString(),
                        address: addressController.text.toString());
                  }
                }
              },
              overlayColor: appColors(context).gray600,
              child: CustomText(
                // text: (state is LoginLoading) ? 'Signing in....' : 'Sign Up',
                text: 'Sign Up',
                color: Colors.white,
                size: 16.h,
                fontWeight: FontWeight.w400,
              ),
            );
          },
        ).addMargin(EdgeInsets.symmetric(vertical: 24.h)),
      ],
    );
  }
}
