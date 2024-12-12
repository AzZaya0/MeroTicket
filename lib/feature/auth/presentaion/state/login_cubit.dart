// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:template/config/constants/asset_manager.dart';
import 'package:template/config/router/routers.dart';
import 'package:template/core/common/custom_snackbar.dart';
import 'package:template/feature/auth/data/models/login_model.dart';
import 'package:template/feature/auth/data/models/organization_category_model.dart';
import 'package:template/feature/auth/domain/repository/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginState());
  final LoginRepo loginRepo;

  login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    EasyLoading.show(
      indicator: lottieLoader(
          ctx: context,
          lottieAsset: LottieAssets.ticketLoadingLottie,
          fit: BoxFit.fitHeight,
          height: 200),
      maskType: EasyLoadingMaskType.clear,
    );
    var response = await loginRepo.login(email: email, password: password);
    response.fold(
      (l) {
        EasyLoading.dismiss();
        EasyLoading.showSuccess('Welcome ${l?.data?.user?.name}',
            dismissOnTap: true);
        emit(state.copyWith(loginStatus: LoginStatus.loaded, loginData: l));
        final nav = Navigator.of(context);
        nav.pushNamedAndRemoveUntil(AppRoutes.mainNavRoute, (route) => false);
        print(l?.data);
      },
      (r) {
        EasyLoading.dismiss();
        EasyLoading.showError(r.message, dismissOnTap: true);
        print(r.data);
        emit(state.copyWith(loginStatus: LoginStatus.error));
        kShowSnackBar(
          message: r.message,
          context: context,
        );
      },
    );
  }

  createAccount(
      {required String name,
      required BuildContext context,
      required String email,
      required String phone,
      required String password,
      required String address,
      required String location}) async {
    EasyLoading.show(
      indicator: lottieLoader(
          ctx: context,
          lottieAsset: LottieAssets.ticketLoadingLottie,
          fit: BoxFit.fitHeight,
          height: 200),
      maskType: EasyLoadingMaskType.clear,
    );
    var response = await loginRepo.createAccount(
        name: name,
        email: email,
        phone: phone,
        password: password,
        address: address,
        location: location);
    response.fold(
      (l) {
        final nav = Navigator.of(context);
        print(l?.data);
        EasyLoading.dismiss();
        EasyLoading.showSuccess('Account Created', dismissOnTap: true);
        nav.pushNamedAndRemoveUntil(AppRoutes.loginRoute, (route) => false);
      },
      (r) {
        print(r.data);
        EasyLoading.dismiss();
        EasyLoading.showError(r.data, dismissOnTap: true);
        kShowSnackBar(
          message: r.message,
          context: context,
        );
      },
    );
  }

//
  OrganizationCategoryModel? organizationCategoryModel;
  // List<String>? categoryNameList = [];
  getCategory(BuildContext context) async {
    var response = await loginRepo.getCategory();
    response.fold(
      (l) {
        organizationCategoryModel = l;
        emit(state.copyWith(organizationCategoryModel: l));
      },
      (r) {
        print(r.data);
        kShowSnackBar(
          message: r.message,
          context: context,
        );
      },
    );
  }

  addNameToCategory(String name) {
    emit(state.copyWith(categoryNameList: [name]));
  }

  createVendorAccount({
    required BuildContext context,
    required String name,
    required String email,
    required File companyLogo,
    required String organizationName,
    required String organizationCategory,
    required String phone,
    required String password,
    required String address,
  }) async {
    EasyLoading.show(
      indicator: lottieLoader(
          ctx: context,
          lottieAsset: LottieAssets.ticketLoadingLottie,
          fit: BoxFit.fitHeight,
          height: 200),
      maskType: EasyLoadingMaskType.clear,
    );
    var response = await loginRepo.createVendorAccount(
        name: name,
        email: email,
        phone: phone,
        password: password,
        address: address,
        companyLogo: companyLogo,
        organizationCategory: organizationCategory,
        organizationName: organizationName);
    response.fold(
      (l) {
        EasyLoading.dismiss();
        EasyLoading.showSuccess('Account Created', dismissOnTap: true);
        final nav = Navigator.of(context);
        print(l?.data);
        nav.pushNamedAndRemoveUntil(AppRoutes.loginRoute, (route) => false);
      },
      (r) {
        print(r.data);
        EasyLoading.dismiss();
        EasyLoading.showError(r.data, dismissOnTap: true);
        kShowSnackBar(
          message: r.message,
          context: context,
        );
      },
    );
  }
}
