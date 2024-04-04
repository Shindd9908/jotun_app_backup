import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "receive_gift_request.g.dart";

@JsonSerializable()
class ReceiveGiftRequest extends Equatable {
  @JsonKey(name: "gift_id")
  final int? giftId;
  @JsonKey(name: "type")
  final int? type;

  const ReceiveGiftRequest({this.giftId, this.type});

  factory ReceiveGiftRequest.fromJson(Map<String, dynamic> json) => _$ReceiveGiftRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiveGiftRequestToJson(this);

  @override
  List<Object?> get props => [giftId, type];
}
