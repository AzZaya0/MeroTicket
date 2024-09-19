class ApiEndpoints {
  /// The code snippet is defining static constants for an API endpoint configuration in Dart for api request.
  static const String baseURL = "BASE_URL";
  static const Map<String, dynamic> defaultHeaders = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  static const int connectionTimeout = 5000;
  static const int receiveTimeout = 60000;

  // Endpoints
  static const String baseRoute = "/";
}
