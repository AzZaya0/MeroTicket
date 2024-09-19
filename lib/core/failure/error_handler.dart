class AppErrorHandler {
  final String message;
  final dynamic data;
  final bool status;

  AppErrorHandler({
    required this.message,
    required this.status,
    this.data,
  });

  @override
  String toString() {
    return 'AppErrorHandler(message: $message, data: $data, status: $status)';
  }
}
