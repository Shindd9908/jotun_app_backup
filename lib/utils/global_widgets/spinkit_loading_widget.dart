import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jotub_app/theme/colors.dart';

class SpinKitLoadingWidget extends StatelessWidget {
  final Color? color;
  final double? size;

  const SpinKitLoadingWidget({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(
        color: color ?? AppColor.colorMainWhite,
        size: size ?? 18,
      ),
    );
  }
}
