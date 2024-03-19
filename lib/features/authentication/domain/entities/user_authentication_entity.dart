import "package:equatable/equatable.dart";

class UserInfoEntity extends Equatable {
  final int? userId;
  final String? username;
  final String? userCompany;
  final String? userMCCode;
  final int? saleId;
  final String? saleName;
  final int? groupId;
  final String? accessToken;
  final String? name;

  const UserInfoEntity(
      {required this.userId,
      required this.username,
      required this.userCompany,
      required this.userMCCode,
      required this.saleId,
      required this.saleName,
      required this.groupId,
      required this.accessToken,
      required this.name});

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
