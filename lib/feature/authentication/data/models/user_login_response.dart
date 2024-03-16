import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "user_login_response.g.dart";

@JsonSerializable()
class UserLoginResponse extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "user_type_id")
  final int? userTypeID;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "kana_name")
  final String? kanaName;
  @JsonKey(name: "representative_name")
  final String? representativeName;
  @JsonKey(name: "representative_kana_name")
  final String? representativeKanaName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "email2")
  final String? secondEmail;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "postal_code")
  final String? postalCode;
  @JsonKey(name: "person_in_charge_name")
  final String? personInChargeName;
  @JsonKey(name: "person_in_charge_kana_name")
  final String? personInChargeKanaName;
  @JsonKey(name: "person_in_charge_phone")
  final String? personInChargePhone;
  @JsonKey(name: "person_in_charge_email")
  final String? personInChargeEmail;
  @JsonKey(name: "is_installation_address")
  final int? isInstallationAddress;
  @JsonKey(name: "installation_address")
  final String? installationAddress;
  @JsonKey(name: "is_moving_house")
  final int? isMovingHouse;
  @JsonKey(name: "note")
  final String? note;
  @JsonKey(name: "has_claim")
  final int? hasClaim;
  @JsonKey(name: "claim_msg")
  final String? claimMsg;
  @JsonKey(name: "locale")
  final String? locale;
  @JsonKey(name: "is_push_notification")
  final int? isPushNotification;
  @JsonKey(name: "country_id")
  final int? createdBy;
  @JsonKey(name: "phone")
  final String? phone;

  const UserLoginResponse({
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
    required this.phone,
  });

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) => _$UserLoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginResponseToJson(this);

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
    phone,
  ];
}