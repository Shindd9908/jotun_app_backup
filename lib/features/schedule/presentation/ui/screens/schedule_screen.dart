import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image_main_background.png'),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 32.w,
        ),
        child: SafeArea(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    'assets/icons/icon_arrow_back.png',
                    width: 36.w,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 24.h,
                  bottom: 8.h,
                ),
                child: Image.asset(
                  'assets/images/image_title.png',
                  width: 260.w,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 4.h,
                ),
                margin: EdgeInsets.only(
                  bottom: 36.h,
                ),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/image_background_text.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  'NGÀY 1: 07/05/2024',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: const Color(0xff1A465C),
                    fontSize: 20.sp,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '08:00',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 16.sp,
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    children: [
                      SizedBox(height: 8.h),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 44,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Đón tiếp tại sân bay và di chuyển về resort',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
