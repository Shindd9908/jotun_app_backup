import 'package:dio/dio.dart';
import 'package:jotub_app/core/models/api_response.dart';
import 'package:jotub_app/features/mini_game/data/models/gift_response.dart';
import 'package:retrofit/http.dart';

part 'mini_game_api.g.dart';

@RestApi()
abstract class MiniGameApi {
  factory MiniGameApi(Dio dio, {String baseUrl}) = _MiniGameApi;

  @GET("/gifts?type={type}")
  Future<ApiResponse<List<GiftResponse>>> fetchListGift(
    @Path('type') String type,
  );
}
