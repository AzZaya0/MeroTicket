import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:template/config/constants/api_endpoints.dart';

import 'dio_error_interceptor.dart';
// import 'package:socket_io_client/socket_io_client.dart' as io;

class Api {
  final Dio _dio = Dio();

  /// The code `final io.Socket _socket = io.io(...)` is creating a socket connection using the
  /// `socket_io_client` library. It establishes a connection to the specified `ApiEndpoints.socketURL`
  /// using the WebSocket transport protocol. The `transports` option is set to `['websocket']` to
  /// ensure that only the WebSocket transport is used for the connection.
  //? final io.Socket _socket = io.io(
  //?   ApiEndpoints.socketURL,
  //?   <String, dynamic>{
  //?     'transports': ['websocket']
  //?   },
  //? );

  Api() {
    _dio
      ..options.baseUrl = ApiEndpoints.baseURL
      ..options.headers = ApiEndpoints.defaultHeaders
      ..options.connectTimeout = ApiEndpoints.connectionTimeout
      ..options.receiveTimeout = ApiEndpoints.receiveTimeout
      // ..httpClientAdapter = HttpClientAdapter()
      ..interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
        ),
      )
      ..interceptors.add(DioErrorInterceptor());
  }

  Dio get sendRequest => _dio;

  /// The line `io.Socket get getSocket => _socket;` is defining a getter method named `getSocket` that
  /// returns the value of the `_socket` variable. This getter allows other parts of the code to access
  /// the `_socket` variable from outside the `Api` class.
  //? io.Socket get getSocket => _socket;
}

/// The `ApiResponse` class represents the response from an API call, including the success status,
/// data, and optional message.
class ApiResponse {
  bool success;
  dynamic data;
  String? message;

  ApiResponse({required this.success, this.data, this.message});

  /// The function `ApiResponse.fromResponse` is a factory constructor in Dart that takes a `Response`
  /// object and returns an `ApiResponse` object with the success status, data, and message extracted
  /// from the response data.
  /// 
  /// Args:
  ///   response (Response): The parameter "response" is of type "Response", which is likely an HTTP
  /// response object.
  /// 
  /// Returns:
  ///   The method is returning an instance of the ApiResponse class.
  factory ApiResponse.fromResponse(Response response) {
    try {
      final data = response.data as Map<String, dynamic>;
      return ApiResponse(
        success: data["success"],
        data: data["data"],
        message: data["message"] ?? "Unexpected error",
      );
    } catch (e) {
      rethrow;
    }
  }
}
