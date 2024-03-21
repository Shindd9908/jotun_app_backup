// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordRequest _$ChangePasswordRequestFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordRequest(
      oldPassword: json['old_password'] as String?,
      password: json['password'] as String?,
      passwordConfirmation: json['password_confirmation'] as String?,
      username: json['username'] as String?,
      role: json['role'] as int?,
    );

Map<String, dynamic> _$ChangePasswordRequestToJson(
        ChangePasswordRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'role': instance.role,
      'old_password': instance.oldPassword,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
    };
