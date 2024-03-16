import "package:equatable/equatable.dart";
import "package:jotub_app/core/models/paginate_response.dart";
import "package:json_annotation/json_annotation.dart";

import "api_error.dart";

part "api_response.g.dart";

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> extends Equatable {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "code")
  final int? statusCode;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final T? data;
  @JsonKey(name: "paginate")
  final Paginate? paginate;
  @JsonKey(name: "errors")
  final ApiError? errors;

  const ApiResponse({
    this.status,
    this.statusCode,
    this.message,
    this.data,
    this.paginate,
    this.errors,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);

  bool get isSuccess => status == "success";

  Object? getValue() {
    if (isSuccess) {
      return data!;
    } else {
      return errors;
    }
  }

  @override
  List<Object?> get props => [status, statusCode, message, data, paginate, errors];
}
