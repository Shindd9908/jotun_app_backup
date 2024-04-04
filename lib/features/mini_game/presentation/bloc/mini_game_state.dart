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
  final int? achievements;

  const InitBoardSuccessState({required this.board, required this.cardStateKeys, required this.achievements});

  @override
  List<Object?> get props => [board, cardStateKeys, achievements];
}

class InitBoardFailState extends MiniGameState {
  @override
  List<Object?> get props => [];
}

// Check if received gift
class CheckIfReceivedGiftLoadingState extends MiniGameState {
  @override
  List<Object> get props => [];
}

class CheckIfReceivedGiftSuccessState extends MiniGameState {
  final bool isReceivedGift;
  final GiftEntity? gift;

  const CheckIfReceivedGiftSuccessState({required this.isReceivedGift, this.gift});

  @override
  List<Object?> get props => [isReceivedGift, gift];
}

class CheckIfReceivedGiftFailState extends MiniGameState {
  final String message;

  const CheckIfReceivedGiftFailState({required this.message});

  @override
  List<Object> get props => [message];
}
