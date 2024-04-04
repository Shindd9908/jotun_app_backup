import 'package:jotub_app/features/mini_game/data/models/achievements_response.dart';
import 'package:jotub_app/features/mini_game/domain/entities/achievements_entity.dart';

extension AchievementsMapExt on AchievementsResponse {
  AchievementsEntity get achievementsEntity => AchievementsEntity(achievements: achievements);
}
