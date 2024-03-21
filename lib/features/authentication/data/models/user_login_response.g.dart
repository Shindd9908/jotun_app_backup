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
      saleId: json['sales_id'] as int?,
      saleName: json['sales'] as String?,
      groupId: json['group_id'] as int?,
      accessToken: json['access_token'] as String?,
      name: json['name'] as String?,
      gender: json['gender'] as int?,
    );

Map<String, dynamic> _$UserLoginResponseToJson(UserLoginResponse instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'username': instance.username,
      'company': instance.userCompany,
      'identity_card_number': instance.identityCardNumber,
      'sales_id': instance.saleId,
      'sales': instance.saleName,
      'group_id': instance.groupId,
      'access_token': instance.accessToken,
      'name': instance.name,
      'gender': instance.gender,
    };
