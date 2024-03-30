import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jotub_app/features/mini_game/presentation/bloc/mini_game_bloc.dart';
import 'package:jotub_app/features/mini_game/presentation/ui/screens/gift_screen.dart';
import 'package:jotub_app/features/mini_game/presentation/ui/widgets/result_widget.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/spinkit_loading_widget.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key, this.isCompleted}) : super(key: key);

  final bool? isCompleted;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MiniGameBloc>().add(const CheckIsReceivedGiftEvent());
  }

  @override
  Widget build(BuildContext context) {
    final bool isCompletedMiniGame = widget.isCompleted != null ? widget.isCompleted! : false;
    return BlocBuilder<MiniGameBloc, MiniGameState>(
      buildWhen: (_, current) =>
        current is CheckIfReceivedGiftLoadingState ||
        current is CheckIfReceivedGiftSuccessState ||
        current is CheckIfReceivedGiftFailState,
      builder: (context, state) {
        if (isCompletedMiniGame == false) {
          return ResultWidget(isCompletedMiniGame: isCompletedMiniGame);
        } else if (state is CheckIfReceivedGiftSuccessState) {
          if (state.isReceivedGift == true) {
            return ResultWidget(isCompletedMiniGame: isCompletedMiniGame);
          } else {
            return GiftScreen(gift: state.gift);
          }
        }
        return const ScreenFrame(
          isCenter: true,
          child: SpinKitLoadingWidget(color: AppColor.colorMainWhite, size: 36),
        );
      },
    );
  }
}
