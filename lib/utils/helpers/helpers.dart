import "package:jotub_app/utils/constants/constants.dart";
import "package:sizer/sizer.dart";

class AppHelper {
  AppHelper._();

  static bool isValidPhoneNumber(String phoneNumber) {
    return Constants.phoneNumberRegex.hasMatch(phoneNumber);
  }

  static double setMultiDeviceSize(double tablet, double mobile) {
    return SizerUtil.deviceType == DeviceType.tablet ? tablet : mobile;
  }
}
