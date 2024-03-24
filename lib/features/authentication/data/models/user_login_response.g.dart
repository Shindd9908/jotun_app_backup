// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginResponse _$UserLoginResponseFromJson(Map<String, dynamic> json) =>
    UserLoginResponse(
      userId: json['user_id'] as int?,
      username: json['username'] as String?,
      userCompany: json['company'] as String?,
      identityCardNumber: json['identity_card_number'] as String?,
      salesId: json['sales_id'] as int?,
      salesName: json['sales'] as String?,
      salesPhoneNumber: json['sales_phone'] as String?,
      groupId: json['group_id'] as int?,
      accessToken: json['access_token'] as String?,
      name: json['name'] as String?,
      gender: json['gender'] as int?,
      busNo: json['bus_no'] as String?,
      hotel: json['hotel'] as String?,
    );

Map<String, dynamic> _$UserLoginResponseToJson(UserLoginResponse instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'username': instance.username,
      'company': instance.userCompany,
      'identity_card_number': instance.identityCardNumber,
      'sales_id': instance.salesId,
      'sales': instance.salesName,
      'sales_phone': instance.salesPhoneNumber,
      'group_id': instance.groupId,
      'access_token': instance.accessToken,
      'name': instance.name,
      'gender': instance.gender,
      'bus_no': instance.busNo,
      'hotel': instance.hotel,
    };
