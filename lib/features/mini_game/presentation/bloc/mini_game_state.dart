part of 'mini_game_bloc.dart';

@immutable
abstract class MiniGameState extends Equatable {
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

  const InitBoardSuccessState({required this.board});

  @override
  List<Object?> get props => [board];
}

class InitBoardFailState extends MiniGameState {
  @override
  List<Object> get props => [];
}
