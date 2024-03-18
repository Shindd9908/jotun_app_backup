import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/image_main_background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 24.h,
                horizontal: 34.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/icon_avatar.png',
                        width: 40.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'HOÀNG VĂN A',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              height: 1.sp,
                              letterSpacing: 0.1,
                            ),
                          ),
                          Text(
                            'Nhóm 10',
                            style: TextStyle(
                              color: const Color(0xffE1AA40),
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                              height: 1.sp,
                              letterSpacing: 0.1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/icons/icon_notification.png',
                    width: 40.w,
                  )
                ],
              ),
            ),
            Image.asset('assets/images/image_banner.png'),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 28.w,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 18.h,
                      bottom: 12.h,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sự kiện sắp diễn ra',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          letterSpacing: 0.05,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      ),
                    ),
                    padding: EdgeInsets.only(
                      top: 20.h,
                      left: 8.w,
                      right: 8.w,
                      bottom: 4.h,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'LỄ KỶ NIỆM 20 NĂM\nNGÀNH SƠN TRANG TRÍ JOTUN VIỆT NAM',
                          style: TextStyle(
                            color: const Color(0xffF19F3B),
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            letterSpacing: -0.9,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 18.h,
                            bottom: 18.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/icon_calendar.png',
                                    width: 24.w,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    '20:00',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/icon_calendar.png',
                                    width: 24.w,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    'Hội trường Ariyana',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Yêu cầu sự kiện: Lễ phục, trang phục dự tiệc',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(height: 32.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Xem chi tiết hành trình',
                              style: TextStyle(
                                color: const Color(0xffF19F3B),
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: const Color(0xffF19F3B),
                              size: 12.sp,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 12.h,
                      bottom: 12.h,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Tính năng',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          letterSpacing: 0.05,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 180.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff848689),
                                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                                  ),
                                  child: Image.asset(
                                    'assets/icons/icon_map.png',
                                    width: 40.w,
                                    height: 40.w,
                                  ),
                                ),
                                Text(
                                  'Khám phá\nlịch trình',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                    letterSpacing: 0.05,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff848689),
                                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                                  ),
                                  child: Image.asset(
                                    'assets/icons/icon_product.png',
                                    width: 40.w,
                                    height: 40.w,
                                  ),
                                ),
                                Text(
                                  'Thông tin sản\nphẩm mới',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                    letterSpacing: 0.05,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff848689),
                                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                                  ),
                                  child: Image.asset(
                                    'assets/icons/icon_gift.png',
                                    width: 40.w,
                                    height: 40.w,
                                  ),
                                ),
                                Text(
                                  'Trải nghiệm &\nnhận quà',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                    letterSpacing: 0.05,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff848689),
                                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                                  ),
                                  child: Image.asset(
                                    'assets/icons/icon_minigame.png',
                                    width: 40.w,
                                    height: 40.w,
                                  ),
                                ),
                                Text(
                                  'Mini game\n',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                    letterSpacing: 0.05,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff848689),
                                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                                  ),
                                  child: Image.asset(
                                    'assets/icons/icon_order.png',
                                    width: 40.w,
                                    height: 40.w,
                                  ),
                                ),
                                Text(
                                  'Đặt hàng trước',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                    letterSpacing: 0.05,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff848689),
                                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                                  ),
                                  child: Image.asset(
                                    'assets/icons/icon_coupon.png',
                                    width: 40.w,
                                    height: 40.w,
                                  ),
                                ),
                                Text(
                                  'Chương trình\nkhuyến mãi',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                    letterSpacing: 0.05,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
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
