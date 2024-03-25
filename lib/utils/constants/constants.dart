import 'package:flutter/cupertino.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/utils/routers/paths.dart';

class Constants {
  Constants._();

  static const String kDefaultAppName = "Jotun";
  static const String kDefaultLanguage = "vi";

  static List<Map<String, dynamic>> getListFeatureHomePage(BuildContext context) {
    return [
      {
        "featureName": S.of(context).exploreSchedule,
        "pathIcon": AppAssets.iconMap,
        "pathScreenNavigateOnTap": AppPaths.tripScreen,
      },
      {
        "featureName": S.of(context).experienceAndReceiveGift,
        "pathIcon": AppAssets.iconGift,
        "pathScreenNavigateOnTap": AppPaths.journeyScreen,
      },
      {
        "featureName": S.of(context).preorder,
        "pathIcon": AppAssets.iconOrder,
        "pathScreenNavigateOnTap": AppPaths.tripScreen,
      },
      {
        "featureName": S.of(context).newProductInformation,
        "pathIcon": AppAssets.iconProduct,
        "pathScreenNavigateOnTap": AppPaths.tripScreen,
      },
      {
        "featureName": S.of(context).miniGame,
        "pathIcon": AppAssets.iconMiniGame,
        "pathScreenNavigateOnTap": AppPaths.tripScreen,
      },
      {
        "featureName": S.of(context).promotions,
        "pathIcon": AppAssets.iconCoupon,
        "pathScreenNavigateOnTap": AppPaths.tripScreen,
      },
    ];
  }

  /// - Regex
  static const phoneNumberRegex = r"^(0|\+84)9[0-9]{8}$";
  static const idCardNumberRegex = r"\b\d{9,12}\b";
  static const allowEmailRegex = r"[0-9a-zA-Z@.+-_]";
  static const allowOnlyNumberRegex = r"[0-9]";
}
