class Constants {
  Constants._();

  static const String kDefaultAppName = "Jotun";
  static const String kDefaultLanguage = "vi";

  /// - Regex
  static const phoneNumberRegex = r"^(0|\+84)9[0-9]{8}$";
  static const idCardNumberRegex = r"\b\d{9,12}\b";
  static const allowEmailRegex = r"[0-9a-zA-Z@.+-_]";
  static const allowOnlyNumberRegex = r"[0-9]";
}
