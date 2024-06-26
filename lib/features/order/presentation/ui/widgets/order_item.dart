import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            height: 90.h,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              gradient: AppColor.colorBackgroundOrderScreen,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColor.colorMainWhite,
                width: 3,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  titleProduct,
                  width: 92.w,
                  fit: BoxFit.contain,
                ),
                Image.asset(
                  image,
                  width: 82.w,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: 22.w,
            padding: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              color: AppColor.colorMainWhite,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                TextWidget(
                  text: S.of(context).amount,
                  color: AppColor.colorMainBlack,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                  fontSize: 8.sp,
                ),
                Container(
                  transform: Matrix4.translationValues(0, -2, 0),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: S.of(context).minusIcon,
                        color: AppColor.colorMainBlack,
                        fontWeight: FontWeight.bold,
                      ),
                      TextWidget(
                        text: amount.toString(),
                        color: AppColor.colorMainBlack,
                        fontWeight: FontWeight.bold,
                      ),
                      TextWidget(
                        text: S.of(context).plusIcon,
                        color: AppColor.colorMainBlack,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
