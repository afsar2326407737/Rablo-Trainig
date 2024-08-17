import 'package:dio/dio.dart';

class AppExceptions {
  AppExceptions._();
  static String handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection Timeout";
      case DioExceptionType.receiveTimeout:
        return "Receive Timeout";
      case DioExceptionType.badResponse:
        return "Invalid Response: ${error.response?.statusCode}";
      case DioExceptionType.cancel:
        return "Request Cancelled";
      case DioExceptionType.unknown:
        return "Unexpected Error: ${error.message}";
      default:
        return "Something went wrong";
    }
  }
}
