// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftResponse _$GiftResponseFromJson(Map<String, dynamic> json) => GiftResponse(
      giftId: json['id'] as int?,
      giftUrl: json['url'] as String?,
      content: json['content'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$GiftResponseToJson(GiftResponse instance) =>
    <String, dynamic>{
      'id': instance.giftId,
      'url': instance.giftUrl,
      'content': instance.content,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
