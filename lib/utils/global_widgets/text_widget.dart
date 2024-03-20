import 'package:flutter/material.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:sizer/sizer.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final Color? color;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLine;
  final TextDecoration? textDecoration;
  final TextOverflow? textOver;
  final FontStyle? fontStyle;
  final double? height;

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
    this.fontFamily,
    this.fontStyle,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: textStyle ??
          TextStyle(
            color: color ?? AppColor.colorMainBlack,
            fontSize: fontSize ?? AppHelper.setMultiDeviceSize(20, 16),
            fontWeight: fontWeight ?? FontWeight.w500,
            fontFamily: fontFamily ?? 'Roboto',
            decoration: textDecoration ?? TextDecoration.none,
            height: height,
            fontStyle: fontStyle,
          ),
      maxLines: maxLine ?? 9999,
      overflow: textOver ?? TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
