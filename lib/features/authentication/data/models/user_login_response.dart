import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "user_login_response.g.dart";

@JsonSerializable()
class UserLoginResponse extends Equatable {
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "company")
  final String? userCompany;
  @JsonKey(name: "mc_code")
  final String? userMCCode;
  @JsonKey(name: "sales_id")
  final int? saleId;
  @JsonKey(name: "sales")
  final String? saleName;
  @JsonKey(name: "group_id")
  final int? groupId;
  @JsonKey(name: "access_token")
  final String? accessToken;
  @JsonKey(name: "name")
  final String? name;

  const UserLoginResponse({
    required this.userId,
    required this.username,
    required this.userCompany,
    required this.userMCCode,
    required this.saleId,
    required this.saleName,
    required this.groupId,
    required this.accessToken,
    required this.name,
  });

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) => _$UserLoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginResponseToJson(this);

  @override
  List<Object?> get props => [
        userId,
        username,
        userCompany,
        userMCCode,
        saleId,
        saleName,
        groupId,
        accessToken,
        name,
      ];
}
