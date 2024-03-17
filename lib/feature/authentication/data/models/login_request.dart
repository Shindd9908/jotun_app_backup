import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "login_request.g.dart";

@JsonSerializable()
class LoginRequest extends Equatable {
  @JsonKey(name: "code")
  final String? userCode;
  final String? password;

  const LoginRequest({
    this.userCode,
    this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  @override
  List<Object?> get props => [
        userCode,
        password,
      ];
}
