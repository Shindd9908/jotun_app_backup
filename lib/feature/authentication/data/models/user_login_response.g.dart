// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginResponse _$UserLoginResponseFromJson(Map<String, dynamic> json) =>
    UserLoginResponse(
      id: json['id'] as int?,
      code: json['code'] as String?,
      userTypeID: json['user_type_id'] as int?,
      name: json['name'] as String?,
      kanaName: json['kana_name'] as String?,
      representativeName: json['representative_name'] as String?,
      representativeKanaName: json['representative_kana_name'] as String?,
      email: json['email'] as String?,
      secondEmail: json['email2'] as String?,
      address: json['address'] as String?,
      postalCode: json['postal_code'] as String?,
      personInChargeName: json['person_in_charge_name'] as String?,
      personInChargeKanaName: json['person_in_charge_kana_name'] as String?,
      personInChargePhone: json['person_in_charge_phone'] as String?,
      personInChargeEmail: json['person_in_charge_email'] as String?,
      isInstallationAddress: json['is_installation_address'] as int?,
      installationAddress: json['installation_address'] as String?,
      isMovingHouse: json['is_moving_house'] as int?,
      note: json['note'] as String?,
      hasClaim: json['has_claim'] as int?,
      claimMsg: json['claim_msg'] as String?,
      locale: json['locale'] as String?,
      isPushNotification: json['is_push_notification'] as int?,
      createdBy: json['country_id'] as int?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$UserLoginResponseToJson(UserLoginResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'user_type_id': instance.userTypeID,
      'name': instance.name,
      'kana_name': instance.kanaName,
      'representative_name': instance.representativeName,
      'representative_kana_name': instance.representativeKanaName,
      'email': instance.email,
      'email2': instance.secondEmail,
      'address': instance.address,
      'postal_code': instance.postalCode,
      'person_in_charge_name': instance.personInChargeName,
      'person_in_charge_kana_name': instance.personInChargeKanaName,
      'person_in_charge_phone': instance.personInChargePhone,
      'person_in_charge_email': instance.personInChargeEmail,
      'is_installation_address': instance.isInstallationAddress,
      'installation_address': instance.installationAddress,
      'is_moving_house': instance.isMovingHouse,
      'note': instance.note,
      'has_claim': instance.hasClaim,
      'claim_msg': instance.claimMsg,
      'locale': instance.locale,
      'is_push_notification': instance.isPushNotification,
      'country_id': instance.createdBy,
      'phone': instance.phone,
    };
