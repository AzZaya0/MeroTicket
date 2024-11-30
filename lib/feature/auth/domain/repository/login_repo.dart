import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:template/core/failure/error_handler.dart';
import 'package:template/feature/auth/data/models/create_account_model.dart';
import 'package:template/feature/auth/data/models/login_model.dart';
import 'package:template/feature/auth/data/models/organization_category_model.dart';
import 'package:template/feature/auth/data/models/vendor_create_account_model.dart';

abstract class LoginRepo {
  Future<Either<CreateAccountModel?, AppErrorHandler>> createAccount(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String address,
      required String location});
  Future<Either<VendorCreateAccountModel?, AppErrorHandler>>
      createVendorAccount({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String address,
    required File companyLogo,
    required String organizationName,
    required String organizationCategory,
  });
  Future<Either<LoginModel?, AppErrorHandler>> login(
      {required String email, required String password});
  Future<Either<OrganizationCategoryModel?, AppErrorHandler>> getCategory();
}
