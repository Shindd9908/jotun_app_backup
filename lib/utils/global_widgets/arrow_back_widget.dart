import 'package:flutter/material.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';

class ArrowBackWidget extends StatelessWidget {
  final Function? callBackPopScreen;

  const ArrowBackWidget({super.key, this.callBackPopScreen});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        if (callBackPopScreen != null) {
          callBackPopScreen!();
        }
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Image.asset(
          AppAssets.iconArrowBack,
          width: AppHelper.setMultiDeviceSize(32, 32),
        ),
      ),
    );
  }
}
