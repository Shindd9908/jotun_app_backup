// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationDataModel _$NotificationDataModelFromJson(
        Map<String, dynamic> json) =>
    NotificationDataModel(
      unread: json['unread'] as int?,
      notificationsDetailModel: (json['notifications'] as List<dynamic>?)
          ?.map((e) =>
              NotificationsDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationDataModelToJson(
        NotificationDataModel instance) =>
    <String, dynamic>{
      'unread': instance.unread,
      'notifications': instance.notificationsDetailModel,
    };
