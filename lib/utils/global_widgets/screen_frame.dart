import 'package:flutter/material.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:sizer/sizer.dart';

class ScreenFrame extends StatelessWidget {
  const ScreenFrame({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgBackgroundPage),
            fit: BoxFit.fill,
          ),
        ),
        padding: padding != null ? padding!.copyWith(top: MediaQuery.of(context).padding.top) : EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: child,
      ),
    );
  }
}
