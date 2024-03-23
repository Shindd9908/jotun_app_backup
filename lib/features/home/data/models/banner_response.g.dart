// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerResponse _$BannerResponseFromJson(Map<String, dynamic> json) =>
    BannerResponse(
      bannerId: json['id'] as int?,
      bannerURL: json['url'] as String?,
      createdAt: json['created_at'] as String?,
      updateAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$BannerResponseToJson(BannerResponse instance) =>
    <String, dynamic>{
      'id': instance.bannerId,
      'url': instance.bannerURL,
      'created_at': instance.createdAt,
      'updated_at': instance.updateAt,
    };
