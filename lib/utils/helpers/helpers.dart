import "package:flutter/cupertino.dart";
import "package:jotub_app/generated/l10n.dart";
import "package:jotub_app/utils/constants/constants.dart";
import "package:sizer/sizer.dart";

class AppHelper {
  AppHelper._();

  static double setMultiDeviceSize(double tablet, double mobile) {
    return SizerUtil.deviceType == DeviceType.tablet ? tablet : mobile;
  }

  static String validateFieldPhoneNumber(BuildContext context, String value) {
    RegExp regExpEmail = RegExp(Constants.phoneNumberRegex);
    String error = '';
    if (value.trim() == '') {
      error = S.of(context).errorFieldRequired;
    } else if (regExpEmail.hasMatch(value) == false) {
      error = S.of(context).errorPhoneNumberIncorrect;
    } else {
      error = '';
    }
    return error;
  }

  static String validateFieldPassword(BuildContext context, String value) {
    String error = '';
    if (value.trim() == '') {
      error = S.of(context).errorFieldRequired;
    } else if (value.trim().length < 8) {
      error = S.of(context).errorPasswordMinLength;
    } else {
      error = '';
    }
    return error;
  }

  static String validateFieldConfirmPassword(BuildContext context, String password, String passwordConfirm) {
    String error = '';
    if (passwordConfirm.trim() == '') {
      error = S.of(context).errorFieldRequired;
    } else if (passwordConfirm.trim() != password.trim()) {
      error = S.of(context).errorPasswordConfirmNotMatch;
    } else {
      error = '';
    }
    return error;
  }

  static String validateFieldRequired(BuildContext context, String value) {
    String error = '';
    if (value.trim() == '') {
      error = S.of(context).errorFieldRequired;
    } else {
      error = '';
    }
    return error;
  }

  static String validateFieldIdCardNumber(BuildContext context, String value) {
    RegExp regExpEmail = RegExp(Constants.idCardNumberRegex);
    String error = '';
    if (value.trim() == '') {
      error = S.of(context).errorFieldRequired;
    } else if (regExpEmail.hasMatch(value) == false) {
      error = S.of(context).errorIdCardNumberIncorrect;
    } else {
      error = '';
    }
    return error;
  }
}
