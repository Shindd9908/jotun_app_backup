import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part 'confirm_account_request.g.dart';

@JsonSerializable()
class ConfirmAccountRequest extends Equatable {
  @JsonKey(name: "identity_card_number")
  final String? identityCardNumber;

  const ConfirmAccountRequest({this.identityCardNumber});

  factory ConfirmAccountRequest.fromJson(Map<String, dynamic> json) => _$ConfirmAccountRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmAccountRequestToJson(this);

  @override
  List<Object?> get props => [identityCardNumber];
}
