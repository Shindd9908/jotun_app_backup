import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "login_request.g.dart";

@JsonSerializable()
class LoginRequest extends Equatable {
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "role")
  final int? role;

  const LoginRequest({
    this.username,
    this.password,
    this.role,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  @override
  List<Object?> get props => [
        username,
        password,
        role,
      ];
}
