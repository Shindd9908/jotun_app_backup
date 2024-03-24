import "package:equatable/equatable.dart";

class UserInfoEntity extends Equatable {
  final int? userId;
  final String? username;
  final String? userCompany;
  final String? identityCardNumber;
  final int? salesId;
  final String? salesName;
  final String? salesPhoneNumber;
  final int? groupId;
  final String? accessToken;
  final String? name;
  final String? avatar;
  final int? gender;
  final String? busNo;
  final String? hotel;

  const UserInfoEntity({
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
