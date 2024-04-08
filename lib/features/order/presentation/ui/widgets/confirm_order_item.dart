import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';

class ConfirmOrderItem extends StatelessWidget {
  const ConfirmOrderItem({
    Key? key,
    required this.titleProduct,
    required this.image,
    required this.amount,
  }) : super(key: key);
  final String titleProduct;
  final String image;
  final int amount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            titleProduct,
            height: 42.h,
          ),
          SizedBox(width: 8.w),
          TextWidget(
            text: 'X$amount',
            color: AppColor.colorMainWhite,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w900,
            fontSize: 24.sp,
          ),
          Image.asset(
            image,
            width: 80.w,
          ),
        ],
      ),
    );
  }
}
