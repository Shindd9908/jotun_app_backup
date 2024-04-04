import 'package:flutter/material.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';

class SampleBoard extends StatelessWidget {
  const SampleBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColor.colorMainWhite,
        ),
      ),
      child: GridView.builder(
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
            child: Image.asset(index == 0 || index == 7
                ? AppAssets.itemMiniGame1
                : AppAssets.itemQuestionMark),
          );
        },
        itemCount: 12,
      ),
    );
  }
}
