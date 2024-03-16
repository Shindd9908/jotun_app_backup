class Constants {
  Constants._();

  static const String kDefaultAppName = "Jotun";
  static const String kDefaultLanguage = "vi";

  /// - Regex
  static final RegExp phoneNumberRegex = RegExp(r"^\d{10,12}$");
}
