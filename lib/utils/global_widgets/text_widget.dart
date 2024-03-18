import 'package:flutter/material.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLine;
  final TextDecoration? textDecoration;
  final TextOverflow? textOver;

  const TextWidget({
    super.key,
    this.text,
    this.maxLine,
    this.textAlign,
    this.textDecoration,
    this.textOver,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: textStyle ??
          TextStyle(
            color: color ?? AppColor.colorMainBlack,
            fontSize: fontSize ?? AppHelper.setWithHeightFontSizeDevicesTabletMobile(20, 16),
            fontWeight: fontWeight ?? FontWeight.w500,
            decoration: textDecoration ?? TextDecoration.none,
          ),
      maxLines: maxLine ?? 9999,
      overflow: textOver ?? TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
