import "package:equatable/equatable.dart";

class UserInfoEntity extends Equatable {
  final int? id;
  final String? code;
  final int? userTypeID;
  final String? name;
  final String? kanaName;
  final String? representativeName;
  final String? representativeKanaName;
  final String? email;
  final String? secondEmail;
  final String? address;
  final String? postalCode;
  final String? personInChargeName;
  final String? personInChargeKanaName;
  final String? personInChargePhone;
  final String? personInChargeEmail;
  final int? isInstallationAddress;
  final String? installationAddress;
  final int? isMovingHouse;
  final String? note;
  final int? hasClaim;
  final String? claimMsg;
  final String? locale;
  final int? isPushNotification;
  final int? createdBy;
  final String? accessToken;
  final String? phone;

  const UserInfoEntity({
    required this.id,
    required this.code,
    required this.userTypeID,
    required this.name,
    required this.kanaName,
    required this.representativeName,
    required this.representativeKanaName,
    required this.email,
    required this.secondEmail,
    required this.address,
    required this.postalCode,
    required this.personInChargeName,
    required this.personInChargeKanaName,
    required this.personInChargePhone,
    required this.personInChargeEmail,
    required this.isInstallationAddress,
    required this.installationAddress,
    required this.isMovingHouse,
    required this.note,
    required this.hasClaim,
    required this.claimMsg,
    required this.locale,
    required this.isPushNotification,
    required this.createdBy,
    required this.accessToken,
    required this.phone,
  });

  @override
  List<Object?> get props => [
    id,
    code,
    userTypeID,
    name,
    kanaName,
    representativeName,
    representativeKanaName,
    email,
    secondEmail,
    address,
    postalCode,
    personInChargeName,
    personInChargeKanaName,
    personInChargePhone,
    personInChargeEmail,
    isInstallationAddress,
    installationAddress,
    isMovingHouse,
    note,
    hasClaim,
    claimMsg,
    locale,
    isPushNotification,
    createdBy,
    accessToken,
    phone,
  ];
}
