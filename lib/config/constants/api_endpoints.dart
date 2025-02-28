// for emulator to render image
String updateImageUrlForEmulator(String url) {
  const String oldBaseUrl = "http://localhost:8000/";
  const String newBaseUrl = "http://10.0.2.2:8000/";

  return url.replaceFirst(oldBaseUrl, newBaseUrl);
}

class ApiEndpoints {
  /// The code snippet is defining static constants for an API endpoint configuration in Dart for api request.
  static const String baseURL = "http://10.0.2.2:8000/api";
  // static const String baseURL = "https://mero-ticket-api.merovision.com/api";
  // static const String baseURL = "https://mero-ticket-api.merovision.com/api";

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
  static const String login = "${ApiEndpoints.baseURL}/login";
  static const String createAccount = "${ApiEndpoints.baseURL}/create-account";
  static const String createVendorAccount =
      "${ApiEndpoints.baseURL}/vendor-signup";
  static const String event = "${ApiEndpoints.baseURL}/event";
  static const String buyTicket = "${ApiEndpoints.baseURL}/user-ticket";
}

class GetApiEndPoints {
  static const String organizationCategory = "${ApiEndpoints.baseURL}/category";
  static const String searchVendor = "${ApiEndpoints.baseURL}/vendors";
  static const String searchEvents = "${ApiEndpoints.baseURL}/event";
  static const String myEvents = "${ApiEndpoints.baseURL}/my-events";
  static const String allEvents = "${ApiEndpoints.baseURL}/event";
  static const String myTickets = "${ApiEndpoints.baseURL}/my-ticket";
  static const String scanTickets = "${ApiEndpoints.baseURL}/check-ticket";
  static const String getEventHistory = "${ApiEndpoints.baseURL}/event-history";
  static const String getEventUsers = "${ApiEndpoints.baseURL}/event-users";
}
