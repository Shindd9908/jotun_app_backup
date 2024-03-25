import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jotub_app/features/mini_game/domain/repositories/mini_game_repository.dart';
import 'package:meta/meta.dart';

part 'mini_game_event.dart';
part 'mini_game_state.dart';

class MiniGameBloc extends Bloc<MiniGameEvent, MiniGameState> {
  MiniGameBloc({ required this.miniGameRepository }) : super(MiniGameInitial()) {
    on<InitBoardEvent>(_init);
  }

  final MiniGameRepository miniGameRepository;

  Future<void> _init(MiniGameEvent event, Emitter<MiniGameState> emit) async {
    emit(InitBoardLoadingState());
    List<String> board = miniGameRepository.getDataMiniGame();
    if (board.isNotEmpty) {
      emit(InitBoardSuccessState(board: board));
    } else {
      emit(InitBoardFailState());
    }
  }
}
