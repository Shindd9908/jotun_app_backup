part of 'mini_game_bloc.dart';

sealed class MiniGameEvent extends Equatable {
  const MiniGameEvent();
}

class InitBoardEvent extends MiniGameEvent {
  const InitBoardEvent();

  @override
  List<Object?> get props => [];
}

class CheckIsReceivedGiftEvent extends MiniGameEvent {
  final int? achievements;

  const CheckIsReceivedGiftEvent({this.achievements});

  @override
  List<Object?> get props => [achievements];
}
