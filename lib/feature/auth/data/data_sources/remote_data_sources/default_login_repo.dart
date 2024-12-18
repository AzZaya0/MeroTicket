import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:template/config/constants/api_endpoints.dart';
import 'package:template/config/constants/pref_key.dart';
import 'package:template/core/failure/error_handler.dart';
import 'package:template/core/network/api/api.dart';
import 'package:template/core/preferences/preferences.dart';
import 'package:template/feature/auth/data/models/create_account_model.dart';
import 'package:template/feature/auth/data/models/login_model.dart';
import 'package:template/feature/auth/data/models/organization_category_model.dart';
import 'package:template/feature/auth/data/models/vendor_create_account_model.dart';
import 'package:template/feature/auth/domain/repository/login_repo.dart';

import '../../../../../core/utils/create_form_data.dart';

class DefaultLoginRepo extends LoginRepo {
  final Api api;
  final Preferences preferences;

  DefaultLoginRepo({
    required this.api,
    required this.preferences,
  });

  @override
  Future<Either<CreateAccountModel?, AppErrorHandler>> createAccount(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String address,
      required String location}) async {
    try {
      final response = await api.sendRequest.post(
        PostApiEndPoints.createAccount,
        data: {
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
          'address': address,
          'location': "Kathmandu",
        },
      );

      if (response.statusCode == 200) {
        var model = CreateAccountModel.fromJson(response.data);

        return left(model);
      } else {
        return right(
          AppErrorHandler(
            message: response.data['message'] as String,
            status: false,
          ),
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return right(
          AppErrorHandler(
            message: e.response?.data['message'],
            status: false,
          ),
        );
      }
      if (e.response?.statusCode == 403) {
        return right(
          AppErrorHandler(
            message: e.response?.data['message'],
            status: false,
          ),
        );
      }
      if (e.response?.statusCode == 422) {
        return right(
          AppErrorHandler(
            message: (e.response?.data['errors']['email']).toString(),
            status: false,
          ),
        );
      }

      if (e.response?.statusCode == 500) {
        return right(
          AppErrorHandler(
            message: (e.response?.data["message"]).toString(),
            status: false,
          ),
        );
      } else {
        return right(
          AppErrorHandler(
            message: e.message.toString(),
            status: false,
          ),
        );
      }
    } catch (e) {
      return right(
        AppErrorHandler(
          message: e.toString(),
          status: false,
        ),
      );
    }
  }

  @override
  Future<Either<LoginModel?, AppErrorHandler>> login(
      {required String email, required String password}) async {
    try {
      final response = await api.sendRequest.post(
        PostApiEndPoints.login,
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        var model = LoginModel.fromJson(response.data);
        await preferences.setString(PrefKey.token, model.data?.token ?? '');
        return left(model);
      } else {
        return right(
          AppErrorHandler(
            message: response.data['message'] as String,
            status: false,
          ),
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return right(
          AppErrorHandler(
            message: e.response?.data['message'],
            status: false,
          ),
        );
      }
      if (e.response?.statusCode == 403) {
        return right(
          AppErrorHandler(
            message: e.response?.data['message'],
            status: false,
          ),
        );
      }
      if (e.response?.statusCode == 422) {
        return right(
          AppErrorHandler(
            message: (e.response?.data['errors']['email']).toString(),
            status: false,
          ),
        );
      }
      if (e.response?.statusCode == 500) {
        return right(
          AppErrorHandler(
            message: (e.response?.data["message"]).toString(),
            status: false,
          ),
        );
      } else {
        return right(
          AppErrorHandler(
            message: e.message.toString(),
            status: false,
          ),
        );
      }
    } catch (e) {
      return right(
        AppErrorHandler(
          message: e.toString(),
          status: false,
        ),
      );
    }
  }

//
  @override
  Future<Either<OrganizationCategoryModel?, AppErrorHandler>>
      getCategory() async {
    try {
      final response = await api.sendRequest.get(
        GetApiEndPoints.organizationCategory,
      );

      if (response.statusCode == 200) {
        var model = OrganizationCategoryModel.fromJson(response.data);

        return left(model);
      } else {
        return right(
          AppErrorHandler(
            message: response.data['message'] as String,
            status: false,
          ),
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return right(
          AppErrorHandler(
            message: e.response?.data['message'],
            status: false,
          ),
        );
      }
      if (e.response?.statusCode == 403) {
        return right(
          AppErrorHandler(
            message: e.response?.data['message'],
            status: false,
          ),
        );
      }
      if (e.response?.statusCode == 422) {
        return right(
          AppErrorHandler(
            message: (e.response?.data['errors']['email']).toString(),
            status: false,
          ),
        );
      }
      if (e.response?.statusCode == 500) {
        return right(
          AppErrorHandler(
            message: (e.response?.data["message"]).toString(),
            status: false,
          ),
        );
      } else {
        return right(
          AppErrorHandler(
            message: e.message.toString(),
            status: false,
          ),
        );
      }
    } catch (e) {
      return right(
        AppErrorHandler(
          message: e.toString(),
          status: false,
        ),
      );
    }
  }

  @override
  Future<Either<VendorCreateAccountModel?, AppErrorHandler>>
      createVendorAccount(
          {required String name,
          required String email,
          required String phone,
          required String password,
          required String address,
          required File companyLogo,
          required String organizationName,
          required String organizationCategory}) async {
    //
    // making request ready
    //organization_logo

    FormData formData = await createFormData('organization_logo', companyLogo, {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'address': address,

      // 'location': "Kathmandu",
    });

    try {
      final response = await api.sendRequest.post(
        PostApiEndPoints.createVendorAccount,
        data: formData,
      );

      if (response.statusCode == 200) {
        var model = VendorCreateAccountModel.fromJson(response.data);

        return left(model);
      } else {
        return right(
          AppErrorHandler(
            message: response.data['message'] as String,
            status: false,
          ),
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return right(
          AppErrorHandler(
            message: e.response?.data['message'],
            status: false,
          ),
        );
      }
      if (e.response?.statusCode == 403) {
        return right(
          AppErrorHandler(
            message: e.response?.data['message'],
            status: false,
          ),
        );
      }
      if (e.response?.statusCode == 422) {
        return right(
          AppErrorHandler(
            message: (e.response?.data['errors']['email']).toString(),
            status: false,
          ),
        );
      }

      if (e.response?.statusCode == 500) {
        return right(
          AppErrorHandler(
            message: (e.response?.data["message"]).toString(),
            status: false,
          ),
        );
      } else {
        return right(
          AppErrorHandler(
            message: e.message.toString(),
            status: false,
          ),
        );
      }
    } catch (e) {
      return right(
        AppErrorHandler(
          message: e.toString(),
          status: false,
        ),
      );
    }
  }
  //
}
