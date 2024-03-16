// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      message: json['message'] as String?,
      userModel: json['user'] == null
          ? null
          : UserLoginResponse.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String?,
      tokenType: json['token_type'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.userModel,
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
    };
