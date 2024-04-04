import "package:json_annotation/json_annotation.dart";
part "api_error.g.dart";

@JsonSerializable()
class ApiError {
  @JsonKey(name: "field")
  final String field;
  @JsonKey(name: "message")
  final String message;

  ApiError({
    required this.field,
    required this.message,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      field: json["field"],
      message: json["message"],
    );
  }

  @override
  String toString() {
    return "Field: $field, Message: $message";
  }
}
