import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/features/home/presentation/ui/screens/home_screen.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const HomeScreen(),
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppHelper.setMultiDeviceSize(context, 744.w, 393.w),
      height: AppHelper.setMultiDeviceSize(context, 1133.h, 852.h),
      color: AppColor.colorMainDarkBlue,
      child: Image.asset(
        AppAssets.imgSplashScreen,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
