import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "complete_area_request.g.dart";

@JsonSerializable()
class CompleteAreaRequest extends Equatable {
  @JsonKey(name: "area_id")
  final int? areaId;

  const CompleteAreaRequest({this.areaId});

  factory CompleteAreaRequest.fromJson(Map<String, dynamic> json) => _$CompleteAreaRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteAreaRequestToJson(this);

  @override
  List<Object?> get props => [areaId];
}
