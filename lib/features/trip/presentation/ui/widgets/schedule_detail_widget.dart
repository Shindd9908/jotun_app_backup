import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/features/journey/domain/entities/area_entity.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';

class ScheduleDetailWidget extends StatelessWidget {
  final ScheduleEntity schedule;

  const ScheduleDetailWidget({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppHelper.setMultiDeviceSize(context, 30.h, 24.h)),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 4.w),
              child: TextWidget(
                text: schedule.timeStart ?? '',
                color: AppColor.colorMainWhite,
                fontSize: AppHelper.setMultiDeviceSize(context, 18.sp, 14.sp),
                fontWeight: FontWeight.w900,
              ),
            ),
            Container(
              transform: Matrix4.translationValues(5.w, AppHelper.setMultiDeviceSize(context, 8.w, 6.w), 0),
              width: AppHelper.setMultiDeviceSize(context, 10.w, 8.w),
              height: AppHelper.setMultiDeviceSize(context, 10.w, 8.w),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.w, right: 10.w),
              child: const VerticalDivider(width: 2, color: Colors.white),
            ),
            Flexible(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: schedule.content ?? '',
                    color: AppColor.colorMainWhite,
                    fontSize: AppHelper.setMultiDeviceSize(context, 16.sp, 12.sp),
                    fontWeight: FontWeight.w900,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 8),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Image.asset(
                            AppAssets.iconClock,
                            width: AppHelper.setMultiDeviceSize(context, 20.w, 14.w),
                            height: AppHelper.setMultiDeviceSize(context, 20.w, 14.w),
                          ),
                        ),
                        TextWidget(
                          text: schedule.time != null ? AppHelper.convertTimeToDuration(context, schedule.time!) : '',
                          color: AppColor.colorMainWhite,
                          fontSize: AppHelper.setMultiDeviceSize(context, 16.sp, 12.sp),
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
                          width: AppHelper.setMultiDeviceSize(context, 20.w, 14.w),
                          height: AppHelper.setMultiDeviceSize(context, 20.w, 14.w),
                        ),
                      ),
                      TextWidget(
                        text: schedule.address ?? '',
                        color: AppColor.colorMainWhite,
                        fontSize: AppHelper.setMultiDeviceSize(context, 16.sp, 12.sp),
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
