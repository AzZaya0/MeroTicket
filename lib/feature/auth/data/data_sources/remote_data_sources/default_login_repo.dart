import 'package:dartz/dartz.dart';
import 'package:template/config/constants/api_endpoints.dart';
import 'package:template/core/failure/error_handler.dart';
import 'package:template/core/network/api/api.dart';
import 'package:template/feature/auth/data/models/create_account_model.dart';
import 'package:template/feature/auth/data/models/login_model.dart';
import 'package:template/feature/auth/domain/repository/login_repo.dart';
import 'package:dio/dio.dart';

class DefaultLoginRepo extends LoginRepo {
  final Api api;

  DefaultLoginRepo({required this.api});

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
}
