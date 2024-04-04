import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "gift_response.g.dart";

@JsonSerializable()
class GiftResponse extends Equatable {
  @JsonKey(name: "id")
  final int? giftId;
  @JsonKey(name: "url")
  final String? giftURL;
  @JsonKey(name: "content")
  final String? content;
  @JsonKey(name: "type")
  final int? type;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  const GiftResponse({this.giftId, this.giftURL, this.content, this.type, this.createdAt, this.updatedAt});

  factory GiftResponse.fromJson(Map<String, dynamic> json) => _$GiftResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GiftResponseToJson(this);

  @override
  List<Object?> get props => [giftId, giftURL, content, type, createdAt, updatedAt];
}
