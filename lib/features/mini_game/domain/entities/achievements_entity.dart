import 'package:equatable/equatable.dart';

class AchievementsEntity extends Equatable {
  final int? achievements;

  const AchievementsEntity({this.achievements});

  @override
  List<Object?> get props => [achievements];
}
