import "package:equatable/equatable.dart";
import "package:jotub_app/features/authentication/data/models/user_login_response.dart";
import "package:json_annotation/json_annotation.dart";

part "login_response.g.dart";

@JsonSerializable()
class LoginResponse extends Equatable {
  final String? message;
  @JsonKey(name: "user")
  final UserLoginResponse? userModel;
  @JsonKey(name: "access_token")
  final String? accessToken;
  @JsonKey(name: "token_type")
  final String? tokenType;

  const LoginResponse({
    this.message,
    this.userModel,
    this.accessToken,
    this.tokenType,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  List<Object?> get props {
    return [
      message,
      userModel,
      accessToken,
      tokenType,
    ];
  }
}
