import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'complete_mini_game_request.g.dart';

@JsonSerializable()
class CompleteMiniGameRequest extends Equatable {
  @JsonKey(name: 'achievements')
  final int? achievements;

  const CompleteMiniGameRequest({this.achievements});

  factory CompleteMiniGameRequest.fromJson(Map<String, dynamic> json) => _$CompleteMiniGameRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteMiniGameRequestToJson(this);


  @override
  List<Object?> get props => [achievements];
}
