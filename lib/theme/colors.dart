import 'package:flutter/material.dart';

class AppColor {
  static const colorMainWhite = Color(0xffFFFFFF);
  static const colorMainBlack = Color(0xff000000);
  static const colorMainGray = Color(0xff999A9C);
  static const colorSecondaryGray = Color(0xffD6D6D6);
  static const colorBackgroundIconGray = Color(0xff848689);
  static const colorMainYellow = Color(0xffE5A93F);
  static const colorMainDarkBlue = Color(0xff1D4B62);
  static const colorMainRed = Color(0xffDA3831);
  static const colorMainGreen = Color(0xff54B439);

  static const colorDarkBlue01 = Color(0xff38536D);
  static const colorDarkBlue02 = Color(0xFF2c4e63);

  static const colorTransparent = Colors.transparent;

  static const colorBackgroundHeaderTopPage = LinearGradient(
    colors: <Color>[
      Color(0xFF8EB9CC),
      Color(0xFF161F32),
    ],
    begin: Alignment(0, 5),
    end: Alignment(0, 0),
  );

  static const colorBackgroundPromotions = LinearGradient(
    colors: <Color>[
      Color(0xFF161F32),
      Color(0xFF2c4e63),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const colorBackgroundOrderScreen = LinearGradient(
    colors: <Color>[
      Color(0xFF8FBACE),
      Color(0xFF171F32),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
