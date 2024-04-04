import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mini_game_request.g.dart';

@JsonSerializable()
class MiniGameRequest extends Equatable {
  @JsonKey(name: 'achievements')
  final int? achievements;

  const MiniGameRequest({this.achievements});

  factory MiniGameRequest.fromJson(Map<String, dynamic> json) => _$MiniGameRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MiniGameRequestToJson(this);


  @override
  List<Object?> get props => [achievements];
}
