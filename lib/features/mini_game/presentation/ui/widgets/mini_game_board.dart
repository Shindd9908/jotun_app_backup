import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

class MiniGameBoard extends StatefulWidget {
  const MiniGameBoard({Key? key}) : super(key: key);

  @override
  State<MiniGameBoard> createState() => _MiniGameBoardState();
}

class _MiniGameBoardState extends State<MiniGameBoard> {
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
                      child: TextWidget(
                        text: '1:00',
                        color: AppColor.colorMainWhite,
                        fontSize: 12.sp,
                        textAlign: TextAlign.center,
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
          GridView.builder(
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
                child: FlipCard(
                  front: Image.asset(AppAssets.itemQuestionMark),
                  back: Image.asset(AppAssets.itemMiniGame1),
                ),
              );
            },
            itemCount: 16,
          ),
        ],
      ),
    );
  }
}
