// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiResponse<T>(
      status: json['status'] as String?,
      statusCode: json['code'] as int?,
      message: json['message'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      paginate: json['paginate'] == null
          ? null
          : Paginate.fromJson(json['paginate'] as Map<String, dynamic>),
      errors: json['errors'] == null
          ? null
          : ApiError.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiResponseToJson<T>(
  ApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.statusCode,
      'message': instance.message,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'paginate': instance.paginate,
      'errors': instance.errors,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
