import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/utils/routers/routers.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({super.key});

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
                  bottom: 12.h,
                ),
                child: Image.asset(
                  'assets/images/image_title.png',
                  width: 260.w,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 200.h,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 8.h,
                        ),
                        margin: EdgeInsets.only(
                          bottom: 12.h,
                        ),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/image_schedule_2.jpg'),
                            fit: BoxFit.fill,
                            opacity: 0.3,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'NGÀY 1:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      fontSize: 26.sp,
                                    ),
                                  ),
                                  Text(
                                    'Trải nghiệm show diễn thực cảnh\nKý ức Hội An',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      letterSpacing: -0.5,
                                      height: 1.2.sp,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: 120.w,
                                    child: Divider(
                                      color: Colors.white,
                                      height: 8.h,
                                      thickness: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushNamed(AppRoutes.scheduleScreen),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Xem chi tiết hành trình',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                      letterSpacing: -0.5,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 12.sp,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 200.h,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 8.h,
                        ),
                        margin: EdgeInsets.only(
                          bottom: 12.h,
                        ),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/image_schedule_2.jpg'),
                            fit: BoxFit.fill,
                            opacity: 0.3,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'NGÀY 2:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      fontSize: 26.sp,
                                    ),
                                  ),
                                  Text(
                                    'Lễ ra mắt sản phẩm\nJotun Jotashield Bền Màu Toàn Diện',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      letterSpacing: -0.5,
                                      height: 1.2.sp,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: 120.w,
                                    child: Divider(
                                      color: Colors.white,
                                      height: 8.h,
                                      thickness: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushNamed(AppRoutes.scheduleScreen),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Xem chi tiết hành trình',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                      letterSpacing: -0.5,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 12.sp,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 200.h,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 8.h,
                        ),
                        margin: EdgeInsets.only(
                          bottom: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xff1D4B62),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/icons/icon_lock.png',
                            width: 60.w,
                          ),
                        ),
                      ),
                      Container(
                        height: 200.h,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 8.h,
                        ),
                        margin: EdgeInsets.only(
                          bottom: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xff1D4B62),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/icons/icon_lock.png',
                            width: 60.w,
                          ),
                        ),
                      ),
                    ],
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
