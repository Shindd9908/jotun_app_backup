import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:jotub_app/features/mini_game/domain/entities/gift_entity.dart';
import 'package:jotub_app/features/mini_game/domain/repositories/mini_game_repository.dart';

part 'mini_game_event.dart';
part 'mini_game_state.dart';

class MiniGameBloc extends Bloc<MiniGameEvent, MiniGameState> {
  MiniGameBloc({required this.miniGameRepository}) : super(MiniGameInitial()) {
    on<InitBoardEvent>(_initBoard);
    on<FetchGiftEvent>(_fetchGift);
  }

  final MiniGameRepository miniGameRepository;

  Future<void> _initBoard(InitBoardEvent event, Emitter<MiniGameState> emit) async {
    emit(InitBoardLoadingState());

    List<String> board = miniGameRepository.getDataMiniGame();
    List<GlobalKey<FlipCardState>> cardStateKeys = miniGameRepository.getCardStateKeys();
    if (board.isNotEmpty && cardStateKeys.isNotEmpty) {
      emit(InitBoardSuccessState(board: board, cardStateKeys: cardStateKeys));
      emit(ReadyPlayGameState());
    } else {
      emit(InitBoardFailState());
    }
  }

  Future<void> _fetchGift(FetchGiftEvent event, Emitter<MiniGameState> emit) async {
    emit(FetchGiftLoadingState());
    final result = await miniGameRepository.fetchGift();
    result.fold(
      (l) => emit(FetchGiftFailState(message: l)),
      (r) => emit(FetchGiftSuccessState(gift: r)),
    );
  }
}
