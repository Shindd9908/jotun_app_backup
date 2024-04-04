import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/spinkit_loading_widget.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';

class ButtonSubmitWidget extends StatelessWidget {
  final String? title;
  final double? widthButton;
  final double? heightButton;
  final TextStyle? textStyle;
  final bool? isShowLoading;
  final Color? colorLoading;
  final double? sizeLoading;
  final Color? textColor;

  const ButtonSubmitWidget({
    super.key,
    this.title,
    this.widthButton,
    this.heightButton,
    this.textStyle,
    this.isShowLoading,
    this.colorLoading,
    this.sizeLoading,
    this.textColor,
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
          child: isShowLoading == true
              ? SpinKitLoadingWidget(size: sizeLoading ?? AppHelper.setMultiDeviceSize(context, 30.sp, 24.sp))
              : TextWidget(
                  text: title ?? '',
                  textStyle: textStyle ??
                      TextStyle(
                        color: textColor ?? AppColor.colorMainWhite,
                        fontSize: AppHelper.setMultiDeviceSize(context, 28.sp, 22.sp),
                        fontWeight: FontWeight.w700,
                      ),
                ),
        ),
      ],
    );
  }
}
