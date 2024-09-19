import 'package:dartz/dartz.dart';
import 'package:template/core/failure/error_handler.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppErrorHandler, Type>> call(Params params);
}
