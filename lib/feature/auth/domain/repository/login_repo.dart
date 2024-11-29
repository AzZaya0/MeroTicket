import 'package:dartz/dartz.dart';
import 'package:template/core/failure/error_handler.dart';
import 'package:template/feature/auth/data/models/create_account_model.dart';
import 'package:template/feature/auth/data/models/login_model.dart';

abstract class LoginRepo {
  Future<Either<CreateAccountModel?, AppErrorHandler>> createAccount(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String address,
      required String location});
  Future<Either<LoginModel?, AppErrorHandler>> login(
      {required String email, required String password});
}
