import 'package:flutter/material.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:sizer/sizer.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.maybePop(context),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Image.asset(
          AppAssets.iconArrowBack,
          width: 8.w,
        ),
      ),
    );
  }
}
