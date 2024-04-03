import 'package:flutter/material.dart';
import 'package:jotub_app/features/journey/domain/entities/area_entity.dart';
import 'package:jotub_app/features/trip/presentation/ui/widgets/schedule_detail_widget.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:sizer/sizer.dart';

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
          padding: EdgeInsets.symmetric(horizontal: AppHelper.setMultiDeviceSize(32, 32)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: AppHelper.setMultiDeviceSize(42, 42),
                  bottom: AppHelper.setMultiDeviceSize(12, 12),
                  left: AppHelper.setMultiDeviceSize(32, 32),
                  right: AppHelper.setMultiDeviceSize(32, 32),
                ),
                child: Image.asset(AppAssets.imgTitle),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 2),
                decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage(AppAssets.imgBackgroundText), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextWidget(
                  text: '${S.of(context).daySchedule} $tripIndex: ${trip.eventDate!.split('-').reversed.join('/')}',
                  color: AppColor.colorMainDarkBlue,
                  fontSize: AppHelper.setMultiDeviceSize(18.sp, 14.sp),
                  fontWeight: FontWeight.w900,
                ),
              ),
              Expanded(
                child: trip.schedules!.isNotEmpty
                    ? SingleChildScrollView(
                        child: Column(
                          children: List.generate(trip.schedules!.length, (index) => ScheduleDetailWidget(schedule: trip.schedules![index])),
                        ),
                      )
                    : Container(
                        alignment: Alignment.center,
                        height: AppHelper.setMultiDeviceSize(150, 150),
                        child: TextWidget(
                          text: S.of(context).noData,
                          color: AppColor.colorMainWhite,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
