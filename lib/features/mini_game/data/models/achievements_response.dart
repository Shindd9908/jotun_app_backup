import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'achievements_response.g.dart';

@JsonSerializable()
class AchievementsResponse extends Equatable {
  @JsonKey(name: 'achievements')
  final int? achievements;

  const AchievementsResponse({required this.achievements});

  factory AchievementsResponse.fromJson(Map<String, dynamic> json) => _$AchievementsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AchievementsResponseToJson(this);

  @override
  List<Object?> get props => [achievements];
}
