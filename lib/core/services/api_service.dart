import "dart:convert";

import "package:connectivity_plus/connectivity_plus.dart";
import "package:dartz/dartz.dart";
import "package:flutter/foundation.dart";

class ApiServices {
  static Future<Either<String, T>> handleApiError<T>(dynamic error) async {
    String errorMessage = await _getErrorMessage(error);
    if (kDebugMode) {
      print(errorMessage);
    }
    return Left(errorMessage);
  }

  static Future<String> _getErrorMessage(dynamic error) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return "Không có kết nối mạng";
      }

      // Parse JSON error response
      Map<String, dynamic> errorJson = jsonDecode(error);

      // Check if the error response contains 'errors' field
      if (errorJson.containsKey("errors")) {
        List<dynamic> errorList = errorJson["errors"];
        List<String> errorMessages = errorList.map((error) {
          String field = error["field"];
          String message = error["message"];
          return "$field: $message";
        }).toList();

        return errorMessages.join("\n");
      } else {
        // If no 'errors' field found, return status message
        return errorJson["message"] ?? "Unknown error occurred";
      }
    } catch (e) {
      // If unable to parse error as JSON, return original error message
      return error.toString();
    }
  }
}
