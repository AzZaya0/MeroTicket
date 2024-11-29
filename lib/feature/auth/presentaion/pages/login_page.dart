import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:template/config/router/routers.dart';
import 'package:template/config/themes/themeExtension/theme_extension.dart';
import 'package:template/core/utils/extension.dart';
import 'package:template/feature/auth/presentaion/pages/sign_up_page.dart';

import '../../../../core/common/controls/custom_button.dart';
import '../../../../core/common/controls/custom_text.dart';
import '../../../../core/common/controls/custom_textfield.dart';
import '../state/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    // checkLogin(context);
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors(context).gray100,
      appBar: AppBar(backgroundColor: appColors(context).gray100),
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
                    LoginTextfieldSection(
                        title: 'Email',
                        textInputType: TextInputType.emailAddress,
                        hintText: "Enter your Email",
                        validator: (value) {
                          if (value?.trim().isEmpty ?? false) {
                            return "Please enter your phone number!";
                          } else {
                            return null;
                          }
                        },
                        controller: emailController),
                    Gap(16.h),
                    LoginTextfieldSection(
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
                    buttonSection()
                  ],
                ).addMargin(EdgeInsets.symmetric(horizontal: 16.w)),
              ],
            ).addMargin(EdgeInsets.all(16.h)),
          ),
        ),
      ),
    );
  }

  Widget buttonSection() {
    return ButtonSection(
        formKey: _formKey,
        emailController: emailController,
        passwordController: passwordController);
  }

  Widget topTitlesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Login",
          size: 36.h,
          color: appColors(context).gray800,
          fontWeight: FontWeight.w600,
        ),
        // Gap(12.h),
        CustomText(
          text: "Let’s Sign you in.",
          size: 14.h,
          color: appColors(context).gray800,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}

class LoginTextfieldSection extends StatelessWidget {
  const LoginTextfieldSection({
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
        size: 12.h,
        fontWeight: FontWeight.w400,
        color: appColors(context).gray400,
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
  }) : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState>? formKey;
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
                  context.read<LoginCubit>().login(
                      context: context,
                      email: emailController.text.toString(),
                      password: passwordController.text.toString());

                  // if (state is LoginLoading) {
                  //   print("login loading plz wait ");
                  // } else {
                  //   // context.read<LoginCubit>().loginToBraimy(context,
                  //   //     phone: emailController.text.trim().toString(),
                  //   //     password: passwordController.text.trim().toString());
                  // }
                }
              },
              overlayColor: appColors(context).gray600,
              child: CustomText(
                text: (state.loginStatus== LoginStatus.loading) ? 'Logging in....' : 'Login',
                color: Colors.white,
                size: 16.h,
                fontWeight: FontWeight.w400,
              ),
            );
          },
        ).addMargin(EdgeInsets.symmetric(vertical: 24.h)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: 'Sign up ?',
              color: appColors(context).gray400,
              size: 12.h,
              fontWeight: FontWeight.w400,
            ),
            Gap(8.w),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.signUpRoute);
              },
              child: CustomText(
                text: 'Create Account',
                textDecoration: TextDecoration.underline,
                color: appColors(context).orange600,
                size: 12.h,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Gap(50.h),
        CustomButton(
          height: 40.h,
          radius: 8.h,
          width: 200.h,
          padding: const EdgeInsets.all(0),
          color: appColors(context).gray400,
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.vendorSignUpRoute);
          },
          overlayColor: appColors(context).gray600,
          child: CustomText(
            text: 'Create Vendor Account',
            color: Colors.white,
            size: 16.h,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
