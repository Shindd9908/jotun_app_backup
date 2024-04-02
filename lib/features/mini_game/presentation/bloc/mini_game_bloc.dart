import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:jotub_app/features/mini_game/domain/entities/achievements_entity.dart';
import 'package:jotub_app/features/mini_game/domain/entities/gift_entity.dart';
import 'package:jotub_app/features/mini_game/domain/repositories/mini_game_repository.dart';
import 'package:jotub_app/utils/constants/constants.dart';

part 'mini_game_event.dart';
part 'mini_game_state.dart';

class MiniGameBloc extends Bloc<MiniGameEvent, MiniGameState> {
  MiniGameBloc({required this.miniGameRepository}) : super(MiniGameInitial()) {
    on<InitBoardEvent>(_initBoard);
    on<CheckIsReceivedGiftEvent>(_checkIsReceivedGift);
  }

  final MiniGameRepository miniGameRepository;

  Future<void> _initBoard(InitBoardEvent event, Emitter<MiniGameState> emit) async {
    emit(InitBoardLoadingState());

    List<String> board = miniGameRepository.getDataMiniGame();
    List<GlobalKey<FlipCardState>> cardStateKeys = miniGameRepository.getCardStateKeys();

    AchievementsEntity? achievementsEntity;
    final achievementsRes = await miniGameRepository.actionMiniGame(null);
    achievementsRes.fold(
      (l) => null,
      (r) => achievementsEntity = r,
    );
    if (board.isNotEmpty && cardStateKeys.isNotEmpty && achievementsEntity != null) {
      emit(InitBoardSuccessState(board: board, cardStateKeys: cardStateKeys, achievements: achievementsEntity?.achievements ?? 0));
    } else {
      emit(InitBoardFailState());
    }
  }

  Future<void> _checkIsReceivedGift(CheckIsReceivedGiftEvent event, Emitter<MiniGameState> emit) async {
    emit(CheckIfReceivedGiftLoadingState());
    GiftEntity? giftEntity;
    final giftRes = await miniGameRepository.fetchGift();
    giftRes.fold(
      (l) => null,
      (r) => giftEntity = r,
    );
    final result = await miniGameRepository.fetchReceivedGift();

    if (event.achievements != null) {
      await miniGameRepository.actionMiniGame(event.achievements!);
    }

    result.fold(
      (l) => emit(CheckIfReceivedGiftFailState(message: l)),
      (r) async {
        emit(CheckIfReceivedGiftSuccessState(isReceivedGift: r.isNotEmpty, gift: giftEntity));
        if (r.isEmpty && giftEntity != null) {
          await miniGameRepository.receivedGift(giftEntity!.giftId!, Constants.typeGiftMiniGame);
        }
      },
    );
  }
}
