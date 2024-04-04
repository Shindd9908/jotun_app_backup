import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';

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
          GoogleFonts.roboto(
            color: color ?? AppColor.colorMainBlack,
            fontSize: fontSize ?? AppHelper.setMultiDeviceSize(context, 20.sp, 16.sp),
            fontWeight: fontWeight ?? FontWeight.w500,
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
