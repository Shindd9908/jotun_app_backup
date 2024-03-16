import "package:jotub_app/utils/constants/constants.dart";

class AppHelper {
  AppHelper._();

  static bool isValidPhoneNumber(String phoneNumber) {
    return Constants.phoneNumberRegex.hasMatch(phoneNumber);
  }
}
