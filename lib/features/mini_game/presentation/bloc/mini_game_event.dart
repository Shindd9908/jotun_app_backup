part of 'mini_game_bloc.dart';

sealed class MiniGameEvent extends Equatable {
  const MiniGameEvent();
}

class InitBoardEvent extends MiniGameEvent {
  const InitBoardEvent();

  @override
  List<Object?> get props => [];
}

class FetchGiftEvent extends MiniGameEvent {
  const FetchGiftEvent();

  @override
  List<Object?> get props => [];
}
