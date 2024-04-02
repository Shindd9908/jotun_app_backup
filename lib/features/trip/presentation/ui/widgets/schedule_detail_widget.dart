import 'package:flutter/material.dart';
import 'package:jotub_app/features/journey/domain/entities/area_entity.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:sizer/sizer.dart';

class ScheduleDetailWidget extends StatelessWidget {
  final ScheduleEntity schedule;

  const ScheduleDetailWidget({super.key, required this.schedule});

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
                text: schedule.timeStart ?? '08:00',
                color: AppColor.colorMainWhite,
                fontSize: AppHelper.setMultiDeviceSize(16.sp, 12.sp),
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              transform: Matrix4.translationValues(4, 4, 0),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, right: 10),
              child: VerticalDivider(width: 1, color: Colors.white),
            ),
            Flexible(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: schedule.content ?? 'Đón tiếp tại sân bay và di chuyển về resort',
                    color: AppColor.colorMainWhite,
                    fontSize: AppHelper.setMultiDeviceSize(14.sp, 10.sp),
                    fontWeight: FontWeight.w700,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 8),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Image.asset(AppAssets.iconClock, width: 14, height: 14),
                        ),
                        TextWidget(
                          text: schedule.time != null ? AppHelper.convertTimeToDuration(context, schedule.time!) : '1 tiếng 30 phút',
                          color: AppColor.colorMainWhite,
                          fontSize: AppHelper.setMultiDeviceSize(14.sp, 10.sp),
                          fontWeight: FontWeight.w500,
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
                        text: schedule.address ?? 'Cảng hàng không quốc tế Đà Nẵng',
                        color: AppColor.colorMainWhite,
                        fontSize: AppHelper.setMultiDeviceSize(14.sp, 10.sp),
                        fontWeight: FontWeight.w500,
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
