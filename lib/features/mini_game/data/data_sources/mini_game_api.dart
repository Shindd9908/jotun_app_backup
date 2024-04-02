import 'package:dio/dio.dart';
import 'package:jotub_app/core/models/api_response.dart';
import 'package:jotub_app/features/journey/data/models/receive_gift_request.dart';
import 'package:jotub_app/features/mini_game/data/models/achievements_response.dart';
import 'package:jotub_app/features/mini_game/data/models/gift_response.dart';
import 'package:jotub_app/features/mini_game/data/models/mini_game_request.dart';
import 'package:retrofit/http.dart';

part 'mini_game_api.g.dart';

@RestApi()
abstract class MiniGameApi {
  factory MiniGameApi(Dio dio, {String baseUrl}) = _MiniGameApi;

  @GET("/gifts?type={type}")
  Future<ApiResponse<List<GiftResponse>>> fetchListGift(@Path('type') String type);

  @GET("/received-gift/list?type={type}")
  Future<ApiResponse<List<GiftResponse>>> fetchListReceivedGift(@Path('type') String type);

  @POST("/received-gift")
  Future<ApiResponse<String>> receivedGift(@Body() ReceiveGiftRequest receiveGiftRequest);

  @POST("/mini-game")
  Future<ApiResponse<AchievementsResponse>> miniGame(@Body() MiniGameRequest? miniGameRequest);
}
