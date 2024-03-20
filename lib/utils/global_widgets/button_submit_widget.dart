import 'package:flutter/material.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';

class ButtonSubmitWidget extends StatelessWidget {
  final String? title;
  final double? widthButton;
  final double? heightButton;
  final TextStyle? textStyle;

  const ButtonSubmitWidget({
    super.key,
    this.title,
    this.widthButton,
    this.heightButton,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: widthButton ?? double.infinity,
          height: heightButton ?? 74,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: const DecorationImage(
              image: AssetImage(AppAssets.imgBackgroundButton),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          child: TextWidget(
            text: title ?? '',
            textStyle: textStyle ??
                TextStyle(
                  color: AppColor.colorMainWhite,
                  fontSize: AppHelper.setMultiDeviceSize(26, 22),
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
      ],
    );
  }
}
