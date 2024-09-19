import 'package:dio/dio.dart';

class DioErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      // Handle server errors
      if (err.response!.statusCode! >= 300) {
        err = DioError(
          requestOptions: err.requestOptions,
          response: err.response,
          error: err.response!.data['message'] ?? err.response!.statusMessage!,
          type: err.type,
        );
      } else {
        err = DioError(
          requestOptions: err.requestOptions,
          response: err.response,
          error: 'Something went wrong',
          type: err.type,
        );
      }
    } else {
      // Handle connection errors
      err = DioError(
        requestOptions: err.requestOptions,
        error: 'Connection error',
        type: err.type,
      );
    }
    super.onError(err, handler);
  }
}
