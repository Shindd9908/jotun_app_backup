import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gift_response.g.dart';

@JsonSerializable()
class GiftResponse extends Equatable {
  @JsonKey(name: 'id')
  final int? giftId;
  @JsonKey(name: 'url')
  final String? giftUrl;
  @JsonKey(name: 'content')
  final String? content;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const GiftResponse({
    required this.giftId,
    required this.giftUrl,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GiftResponse.fromJson(Map<String, dynamic> json) => _$GiftResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GiftResponseToJson(this);

  @override
  List<Object?> get props => [
        giftId,
        giftUrl,
        content,
        createdAt,
        updatedAt,
      ];
}
