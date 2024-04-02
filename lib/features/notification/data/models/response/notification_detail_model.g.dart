// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsDetailModel _$NotificationsDetailModelFromJson(
        Map<String, dynamic> json) =>
    NotificationsDetailModel(
      id: json['id'] as int?,
      type: json['type'] as int?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      pushTime: json['push_time'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$NotificationsDetailModelToJson(
        NotificationsDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'content': instance.content,
      'push_time': instance.pushTime,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'status': instance.status,
    };
