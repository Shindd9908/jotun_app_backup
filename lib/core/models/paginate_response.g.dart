// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paginate _$PaginateFromJson(Map<String, dynamic> json) => Paginate(
      limit: json['limit'] as int?,
      total: json['total'] as int?,
      currentPage: json['current_page'] as int?,
      size: json['size'] as int?,
      totalPage: json['total_page'] as int?,
    );

Map<String, dynamic> _$PaginateToJson(Paginate instance) => <String, dynamic>{
      'limit': instance.limit,
      'total': instance.total,
      'current_page': instance.currentPage,
      'size': instance.size,
      'total_page': instance.totalPage,
    };
