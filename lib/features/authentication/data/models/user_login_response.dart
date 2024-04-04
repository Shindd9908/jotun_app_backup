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
  @JsonKey(name: "identity_card_number")
  final String? identityCardNumber;
  @JsonKey(name: "sales_id")
  final int? salesId;
  @JsonKey(name: "sales")
  final String? salesName;
  @JsonKey(name: "sales_phone")
  final String? salesPhoneNumber;
  @JsonKey(name: "group_id")
  final int? groupId;
  @JsonKey(name: "access_token")
  final String? accessToken;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "avatar")
  final String? avatar;
  @JsonKey(name: "gender")
  final int? gender;
  @JsonKey(name: "bus_no")
  final String? busNo;
  @JsonKey(name: "hotel")
  final String? hotel;

  const UserLoginResponse({
    this.userId,
    this.username,
    this.userCompany,
    this.identityCardNumber,
    this.salesId,
    this.salesName,
    this.salesPhoneNumber,
    this.groupId,
    this.accessToken,
    this.name,
    this.avatar,
    this.gender,
    this.busNo,
    this.hotel,
  });

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) => _$UserLoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginResponseToJson(this);

  @override
  List<Object?> get props => [
        userId,
        username,
        userCompany,
        identityCardNumber,
        salesId,
        salesName,
        salesPhoneNumber,
        groupId,
        accessToken,
        name,
        avatar,
        gender,
        busNo,
        hotel,
      ];
}
