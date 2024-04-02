import 'package:flutter/cupertino.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/utils/routers/paths.dart';

class Constants {
  Constants._();

  static const String kDefaultAppName = "Jotun";
  static const String kDefaultLanguage = "vi";

  static const int typeGiftJourney = 1;
  static const int typeGiftMiniGame = 2;

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
        "pathScreenNavigateOnTap": AppPaths.newProductsScreen,
      },
      {
        "featureName": S.of(context).miniGame,
        "pathIcon": AppAssets.iconMiniGame,
        "pathScreenNavigateOnTap": AppPaths.introduceMiniGameScreen,
      },
      {
        "featureName": S.of(context).promotions,
        "pathIcon": AppAssets.iconCoupon,
        "pathScreenNavigateOnTap": AppPaths.tripScreen,
      },
    ];
  }

  /// - Regex
  static const phoneNumberRegex = r"^((\+|00)84|0)((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-4679]))\d{7}$";
  static const idCardNumberRegex = r"\b\d{9,12}\b";
  static const allowEmailRegex = r"[0-9a-zA-Z@.+-_]";
  static const allowOnlyNumberRegex = r"[0-9]";
}
