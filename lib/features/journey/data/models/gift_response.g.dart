// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftResponse _$GiftResponseFromJson(Map<String, dynamic> json) => GiftResponse(
      giftId: json['id'] as int?,
      giftURL: json['url'] as String?,
      content: json['content'] as String?,
      type: json['type'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$GiftResponseToJson(GiftResponse instance) =>
    <String, dynamic>{
      'id': instance.giftId,
      'url': instance.giftURL,
      'content': instance.content,
      'type': instance.type,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
