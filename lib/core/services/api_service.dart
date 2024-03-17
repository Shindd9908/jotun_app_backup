import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiServices {
  // Handle errors returned from API calls
  static Future<Either<String, T>> handleApiError<T>(dynamic error) async {
    // If the error is a DioError, handle it accordingly
    if (error is DioException) {
      return _handleDioError(error);
    } else {
      // Otherwise, handle other types of errors
      return _handleOtherErrors(error);
    }
  }

  // Handle DioError which may occur due to network issues or server errors
  static Future<Either<String, T>> _handleDioError<T>(DioException error) async {
    String errorMessage;
    // Check network connectivity status
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      errorMessage = "No network connection";
    } else if (error.response != null) {
      errorMessage = _parseDioErrorResponse(error.response!);
    } else {
      errorMessage = error.toString();
    }

    // Print error message in debug mode
    if (kDebugMode) {
      print(errorMessage);
    }
    return Left(errorMessage);
  }

  // Parse error response from DioError
  static String _parseDioErrorResponse(Response response) {
    String errorMessage = ''; // Thêm giá trị khởi tạo
    try {
      Map<String, dynamic> errorJson = response.data;
      var errorData = errorJson["data"];
      var errorMessageData = errorJson["message"]; // Đổi tên biến để tránh xung đột với biến đã được khai báo

      if (errorData is List && errorData.isNotEmpty) {
        List<String> detailedErrors = errorData.map<String>((errorItem) => errorItem["message"] as String).toList();
        //todo: lỗi trả về nhiều thì cần test và xử lý lại
        errorMessage = detailedErrors.isNotEmpty ? detailedErrors.join("\n") : response.statusMessage ?? "Unknown error occurred";
      } else {
        errorMessage = errorMessageData ?? "Unknown error occurred"; // Sử dụng errorMessageData thay vì errorMessage
      }
    } catch (_) {
      errorMessage = response.statusMessage ?? "Unknown error occurred";
    }
    return errorMessage;
  }


  // Handle other types of errors (e.g., JSON parsing errors)
  static Future<Either<String, T>> _handleOtherErrors<T>(dynamic error) async {
    try {
      // Parse error response as JSON
      Map<String, dynamic> errorJson = jsonDecode(error);
      if (errorJson.containsKey("errors")) {
        // If the error response contains 'errors' field, extract error messages
        List<dynamic> errorList = errorJson["errors"];
        List<String> errorMessages = errorList.map((error) {
          String field = error["field"];
          String message = error["message"];
          return "$field: $message";
        }).toList();

        return Left(errorMessages.join("\n"));
      } else {
        // If no 'errors' field found, return the status message
        return Left(errorJson["message"] ?? "Unknown error occurred");
      }
    } catch (_) {
      // If unable to parse error as JSON, return the original error message
      return Left(error.toString());
    }
  }
}
