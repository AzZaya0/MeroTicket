class ApiEndpoints {
  /// The code snippet is defining static constants for an API endpoint configuration in Dart for api request.
  static const String baseURL = "https://mero-ticket-api.merovision.com/api";
  static const Map<String, dynamic> defaultHeaders = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  static const Duration connectionTimeout = Duration(milliseconds: 5000);
  static const Duration receiveTimeout = Duration(milliseconds: 60000);

  // Endpoints
  static const String baseRoute = "/";
}

class PostApiEndPoints {
  static const String createAccount = "${ApiEndpoints.baseURL}/create-account";
  static const String login = "${ApiEndpoints.baseURL}/login";
}
