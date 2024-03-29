import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jotub_app/features/mini_game/presentation/bloc/mini_game_bloc.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/spinkit_loading_widget.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:jotub_app/utils/routers/paths.dart';
import 'package:sizer/sizer.dart';

class MiniGameBoard extends StatefulWidget {
  const MiniGameBoard({Key? key}) : super(key: key);

  @override
  State<MiniGameBoard> createState() => _MiniGameBoardState();
}

class _MiniGameBoardState extends State<MiniGameBoard> {
  final _start = ValueNotifier<bool>(false);
  final _wait = ValueNotifier<bool>(false);
  final _ignoringPointer = ValueNotifier<bool>(false);
  final _secondLeft = ValueNotifier<int>(60);

  Timer? _countdownTimer;
  int _previousIndex = -1;
  bool _flip = false;
  final List<bool> _firstFlip = List.generate(16, (_) => true);
  final List<bool> _isFlip = List.generate(16, (_) => true);

  void _startCountdownTimer() {
    const oneSecond = Duration(seconds: 1);
    _countdownTimer = Timer.periodic(oneSecond, (timer) {
      if (_secondLeft.value > 0) {
        _secondLeft.value--;
      } else {
        Navigator.pushNamedAndRemoveUntil(context, AppPaths.resultScreen, (route) => false);
      }
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2), () {
        _start.value = true;

        Future.delayed(const Duration(milliseconds: 400), () {
          _startCountdownTimer();
        });
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 16,
              bottom: 32,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppAssets.iconTimer,
                      width: 24,
                    ),
                    Container(
                      width: 58,
                      margin: const EdgeInsets.only(left: 4),
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColor.colorDarkBlue01,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ValueListenableBuilder(
                        valueListenable: _secondLeft,
                        builder: (_, value, __) => TextWidget(
                          text: value == 60 ? '1:00' : '00:${value > 9 ? value.toString() : '0$value'}',
                          color: AppColor.colorMainWhite,
                          fontSize: 12.sp,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      AppAssets.iconStar,
                      width: 28,
                    ),
                    Container(
                      width: 58,
                      margin: const EdgeInsets.only(left: 4),
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColor.colorDarkBlue01,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextWidget(
                        text: '00:59',
                        color: AppColor.colorMainWhite,
                        fontSize: 12.sp,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          BlocBuilder<MiniGameBloc, MiniGameState>(
            buildWhen: (_, current) => current is InitBoardLoadingState || current is InitBoardSuccessState || current is InitBoardFailState,
            builder: (context, state) {
              if (state is InitBoardLoadingState) {
                return SpinKitLoadingWidget(
                  size: AppHelper.setMultiDeviceSize(20.sp, 16.sp),
                  color: AppColor.colorMainWhite,
                );
              }
              if (state is InitBoardSuccessState) {
                List<String> board = state.board ?? [];
                List<GlobalKey<FlipCardState>> cardStateKeys = state.cardStateKeys ?? [];
                return GridView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 6,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      child: ValueListenableBuilder(
                        valueListenable: _start,
                        builder: (_, value, __) {
                          return value
                              ? ValueListenableBuilder(
                                  valueListenable: _ignoringPointer,
                                  builder: (_, ignoringPointerValue, __) {
                                    return ValueListenableBuilder(
                                        valueListenable: _wait,
                                        builder: (_, waitValue, __) {
                                          return IgnorePointer(
                                            ignoring: ignoringPointerValue,
                                            child: FlipCard(
                                              key: cardStateKeys[index],
                                              autoFlipDuration: const Duration(milliseconds: 10),
                                              onFlip: () {
                                                if (!_firstFlip[index]) {
                                                  if (!_flip) {
                                                    _flip = true;
                                                    _previousIndex = index;
                                                  } else {
                                                    _flip = false;
                                                    _wait.value = true;
                                                    if (_previousIndex != index) {
                                                      if (board[_previousIndex] != board[index]) {
                                                        _ignoringPointer.value = true;
                                                        Future.delayed(const Duration(milliseconds: 1200), () {
                                                          cardStateKeys[_previousIndex].currentState?.toggleCard();
                                                          _previousIndex = index;
                                                          cardStateKeys[index].currentState?.toggleCard();
                                                          Future.delayed(const Duration(milliseconds: 400), () {
                                                            _ignoringPointer.value = false;
                                                            _wait.value = false;
                                                          });
                                                        });
                                                      } else {
                                                        _isFlip[_previousIndex] = false;
                                                        _isFlip[index] = false;
                                                        if (_isFlip.every((t) => t == false)) {
                                                          Future.delayed(const Duration(milliseconds: 300), () {
                                                            Navigator.pushNamedAndRemoveUntil(
                                                              context,
                                                              AppPaths.resultScreen,
                                                              arguments: {'isCompleted': true},
                                                              (route) => false,
                                                            );
                                                          });
                                                        } else {
                                                          Future.delayed(const Duration(seconds: 1), () {
                                                            _wait.value = false;
                                                          });
                                                        }
                                                      }
                                                    } else {
                                                      _wait.value = false;
                                                    }
                                                  }
                                                } else {
                                                  _firstFlip[index] = false;
                                                }
                                              },
                                              flipOnTouch: waitValue ? false : _isFlip[index],
                                              front: Image.asset(board[index]),
                                              back: Image.asset(AppAssets.itemQuestionMark),
                                            ),
                                          );
                                        });
                                  })
                              : Image.asset(board[index]);
                        },
                      ),
                    );
                  },
                  itemCount: board.length,
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
