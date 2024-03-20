import 'package:flutter/material.dart';
import 'package:jotub_app/features/home/presentation/ui/screens/home_screen.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:sizer/sizer.dart';

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
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 16.h,
            child: Image.asset(
              AppAssets.imgLogoApp,
              width: 36.w,
            ),
          ),
          Center(
            child: Image.asset(AppAssets.imgBanner),
          ),
        ],
      ),
    );
  }
}
