import 'package:flutter/material.dart';
import 'package:jotub_app/features/schedule/presentation/ui/widgets/detail_schedule.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:sizer/sizer.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                AppAssets.iconArrowBack,
                width: 8.w,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 52,
              bottom: 12,
              left: 8.w,
              right: 8.w,
            ),
            child: Image.asset(AppAssets.imgTitle),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(AppAssets.imgBackgroundText),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextWidget(
              text: 'NGÀY 1: 07/05/2024',
              color: AppColor.colorMainDarkBlue,
              fontSize: AppHelper.setMultiDeviceSize(19.sp, 15.sp),
              fontWeight: FontWeight.w900,
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DetailSchedule(
                    time: '08:00',
                    content: 'Đón tiếp tại sân bay và di chuyển về resort',
                    duration: '1 tiếng 30 phút',
                    address: 'Cảng hàng không quốc tế Đà Nẵng',
                  ),
                  DetailSchedule(
                    time: '15:00',
                    content:
                        'Tham quan & trải nghiệm show diễn thực cảnh Ký ức Hội An',
                    duration: '3 tiếng 30 phút',
                    address: 'Tập trung tại sảnh khách sạn',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
