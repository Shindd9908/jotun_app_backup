import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/features/journey/domain/entities/area_entity.dart';
import 'package:jotub_app/features/trip/presentation/ui/widgets/schedule_detail_widget.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';

class ScheduleScreen extends StatelessWidget {
  final TripEntity trip;
  final int tripIndex;

  const ScheduleScreen({super.key, required this.trip, required this.tripIndex});

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      isHasButtonBack: true,
      child: Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppHelper.setMultiDeviceSize(context, 32.w, 32.w)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: AppHelper.setMultiDeviceSize(context, 42.h, 42.h),
                  bottom: AppHelper.setMultiDeviceSize(context, 18.h, 12.h),
                  left: AppHelper.setMultiDeviceSize(context, 32.w, 32.w),
                  right: AppHelper.setMultiDeviceSize(context, 32.w, 32.w),
                ),
                child: Image.asset(AppAssets.imgTitle),
              ),
              Container(
                margin: EdgeInsets.only(bottom: AppHelper.setMultiDeviceSize(context, 6.h, 4.h)),
                padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 2.h),
                decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage(AppAssets.imgBackgroundText), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextWidget(
                  text: '${S.of(context).daySchedule} $tripIndex: ${trip.eventDate!.split('-').reversed.join('/')}',
                  color: AppColor.colorMainDarkBlue,
                  fontSize: AppHelper.setMultiDeviceSize(context, 26.sp, 18.sp),
                  fontWeight: FontWeight.w900,
                ),
              ),
              if (trip.schedules != null && trip.schedules!.isNotEmpty) ...[
                TextWidget(
                  text: trip.schedules?.first.shiftName ?? '',
                  color: AppColor.colorMainWhite,
                  fontSize: AppHelper.setMultiDeviceSize(context, 26.sp, 18.sp),
                  fontWeight: FontWeight.w900,
                ),
                SizedBox(height: AppHelper.setMultiDeviceSize(context, 8.h, 6.h)),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppHelper.setMultiDeviceSize(context, 80.w, 32.w)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(trip.schedules!.length, (index) => ScheduleDetailWidget(schedule: trip.schedules![index])),
                      ),
                    ),
                  ),
                ),
              ],
              if (trip.schedules == null || trip.schedules!.isEmpty)
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: AppHelper.setMultiDeviceSize(context, 1133.h / 2, 852.h / 2),
                  child: TextWidget(
                    text: S.of(context).noData,
                    color: AppColor.colorMainWhite,
                    fontSize: AppHelper.setMultiDeviceSize(context, 22.sp, 14.sp),
                    fontWeight: FontWeight.w700,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
