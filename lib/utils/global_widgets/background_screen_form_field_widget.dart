import 'package:flutter/material.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:sizer/sizer.dart';

class BackgroundScreenFormFieldWidget extends StatelessWidget {
  final Widget mainUIContent;

  const BackgroundScreenFormFieldWidget({super.key, required this.mainUIContent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.imgBackgroundPage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        mainUIContent
      ],
    );
  }
}
