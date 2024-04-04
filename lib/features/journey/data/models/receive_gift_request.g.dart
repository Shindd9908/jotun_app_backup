// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_gift_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiveGiftRequest _$ReceiveGiftRequestFromJson(Map<String, dynamic> json) =>
    ReceiveGiftRequest(
      giftId: json['gift_id'] as int?,
      type: json['type'] as int?,
    );

Map<String, dynamic> _$ReceiveGiftRequestToJson(ReceiveGiftRequest instance) =>
    <String, dynamic>{
      'gift_id': instance.giftId,
      'type': instance.type,
    };
