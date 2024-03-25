import 'package:jotub_app/features/mini_game/domain/repositories/mini_game_repository.dart';
import 'package:jotub_app/theme/assets.dart';

class MiniGameRepositoryImpl implements MiniGameRepository {
  @override
  List<String> getDataMiniGame() {
    List<String> assets = [
      AppAssets.itemMiniGame1,
      AppAssets.iconStar,
      AppAssets.iconTimer,
      AppAssets.itemQuestionMark,
      AppAssets.iconClock,
      AppAssets.iconGift,
      AppAssets.iconCoupon,
      AppAssets.iconLocation,
    ];
    List<String> data = List.from(assets)..addAll(assets.reversed);
    data.shuffle();
    return data;
  }
}
