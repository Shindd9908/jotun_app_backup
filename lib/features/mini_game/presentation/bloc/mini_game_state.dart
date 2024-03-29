part of 'mini_game_bloc.dart';

sealed class MiniGameState extends Equatable {
  const MiniGameState();
}

class MiniGameInitial extends MiniGameState {
  @override
  List<Object?> get props => [];
}

class InitBoardLoadingState extends MiniGameState {
  @override
  List<Object?> get props => [];
}

class InitBoardSuccessState extends MiniGameState {
  final List<String>? board;
  final List<GlobalKey<FlipCardState>>? cardStateKeys;

  const InitBoardSuccessState({required this.board, required this.cardStateKeys});

  @override
  List<Object?> get props => [board, cardStateKeys];
}

class InitBoardFailState extends MiniGameState {
  @override
  List<Object?> get props => [];
}

// Play mini game
class ReadyPlayGameState extends MiniGameState {
  @override
  List<Object?> get props => [];
}

class CompleteMiniGameState extends MiniGameState {
  @override
  List<Object?> get props => [];
}

class FetchGiftLoadingState extends MiniGameState {
  @override
  List<Object?> get props => [];
}

class FetchGiftSuccessState extends MiniGameState {
  final GiftEntity gift;

  const FetchGiftSuccessState({required this.gift});

  @override
  List<Object?> get props => [gift];
}

class FetchGiftFailState extends MiniGameState {
  final String message;

  const FetchGiftFailState({required this.message});

  @override
  List<Object> get props => [message];
}
