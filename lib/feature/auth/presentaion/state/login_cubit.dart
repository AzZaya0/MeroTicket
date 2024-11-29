// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/config/router/routers.dart';
import 'package:template/core/common/custom_snackbar.dart';
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

    var response = await loginRepo.login(email: email, password: password);
    response.fold(
      (l) {
        emit(state.copyWith(loginStatus: LoginStatus.loaded));
        final nav = Navigator.of(context);
        nav.pushNamedAndRemoveUntil(AppRoutes.mainNavRoute, (route) => false);
        print(l?.data);
      },
      (r) {
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
        nav.pushNamedAndRemoveUntil(AppRoutes.loginRoute, (route) => false);
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
}
