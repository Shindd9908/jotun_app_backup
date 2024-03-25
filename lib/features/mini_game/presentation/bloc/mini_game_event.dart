part of 'mini_game_bloc.dart';

@immutable
abstract class MiniGameEvent extends Equatable {
  const MiniGameEvent();
}

class InitBoardEvent extends MiniGameEvent {
  @override
  List<Object?> get props => [];
}

class FlipCardEvent extends MiniGameEvent {
  @override
  List<Object?> get props => [];
}
