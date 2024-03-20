import 'package:flutter/material.dart';
import 'package:jotub_app/features/trip/presentation/ui/widgets/detail_trip.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:sizer/sizer.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({super.key});

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
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DetailTrip(
                    textDay: 'NGÀY 1:',
                    content: 'Trải nghiệm show diễn thực cảnh\nKý ức Hội An',
                    backgroundImage: 'assets/images/image_schedule_2.jpg',
                  ),
                  DetailTrip(
                    textDay: 'NGÀY 2:',
                    content:
                        'Lễ ra mắt sản phẩm\nJotun Jotashield Bền Màu Toàn Diện',
                    backgroundImage: 'assets/images/image_schedule_2.jpg',
                  ),
                  DetailTrip(unlock: false),
                  DetailTrip(unlock: false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
