import "package:equatable/equatable.dart";

class UserInfoEntity extends Equatable {
  final int? userId;
  final String? username;
  final String? userCompany;
  final String? identityCardNumber;
  final int? saleId;
  final String? saleName;
  final int? groupId;
  final String? accessToken;
  final String? name;
  final int? gender;

  const UserInfoEntity({
    required this.userId,
    required this.username,
    required this.userCompany,
    required this.identityCardNumber,
    required this.saleId,
    required this.saleName,
    required this.groupId,
    required this.accessToken,
    required this.name,
    required this.gender,
  });

  @override
  List<Object?> get props => [
        userId,
        username,
        userCompany,
        identityCardNumber,
        saleId,
        saleName,
        groupId,
        accessToken,
        name,
        gender,
      ];
}
