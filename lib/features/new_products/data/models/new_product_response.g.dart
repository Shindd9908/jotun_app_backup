// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewProductResponse _$NewProductResponseFromJson(Map<String, dynamic> json) =>
    NewProductResponse(
      productId: json['id'] as int?,
      productName: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      capacity: json['capacity'] as String?,
    );

Map<String, dynamic> _$NewProductResponseToJson(NewProductResponse instance) =>
    <String, dynamic>{
      'id': instance.productId,
      'name': instance.productName,
      'description': instance.description,
      'image': instance.image,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'capacity': instance.capacity,
    };
