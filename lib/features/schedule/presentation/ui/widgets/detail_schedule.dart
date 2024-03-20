import 'package:flutter/material.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:sizer/sizer.dart';

class DetailSchedule extends StatelessWidget {
  const DetailSchedule({
    super.key,
    required this.time,
    required this.content,
    required this.duration,
    required this.address,
  });

  final String time;
  final String content;
  final String duration;
  final String address;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              transform: Matrix4.translationValues(0, -4, 0),
              margin: const EdgeInsets.only(right: 4),
              child: TextWidget(
                text: time,
                color: AppColor.colorMainWhite,
                fontSize: AppHelper.setWithHeightFontSizeDevicesTabletMobile(
                    19.sp, 13.sp),
                fontWeight: FontWeight.w900,
              ),
            ),
            Container(
              transform: Matrix4.translationValues(4, 4, 0),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 8,
                right: 10,
              ),
              child: VerticalDivider(
                width: 1,
                color: Colors.white,
              ),
            ),
            Flexible(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: content,
                    color: AppColor.colorMainWhite,
                    fontSize:
                        AppHelper.setWithHeightFontSizeDevicesTabletMobile(
                            19.sp, 10.sp),
                    fontWeight: FontWeight.w900,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 4,
                      bottom: 8,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Image.asset(
                            AppAssets.iconClock,
                            width: 14,
                            height: 14,
                          ),
                        ),
                        TextWidget(
                          text: duration,
                          color: AppColor.colorMainWhite,
                          fontSize: AppHelper
                              .setWithHeightFontSizeDevicesTabletMobile(
                                  19.sp, 10.sp),
                          fontWeight: FontWeight.w900,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Image.asset(
                          AppAssets.iconLocation,
                          width: 14,
                          height: 14,
                        ),
                      ),
                      TextWidget(
                        text: address,
                        color: AppColor.colorMainWhite,
                        fontSize:
                            AppHelper.setWithHeightFontSizeDevicesTabletMobile(
                                19.sp, 10.sp),
                        fontWeight: FontWeight.w900,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
