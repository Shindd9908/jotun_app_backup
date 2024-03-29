import 'package:dio/dio.dart';
import 'package:jotub_app/core/models/api_response.dart';
import 'package:jotub_app/features/journey/data/models/area_response.dart';
import 'package:jotub_app/features/journey/data/models/complete_area_request.dart';
import 'package:jotub_app/features/journey/data/models/gift_response.dart';
import 'package:jotub_app/features/journey/data/models/receive_gift_request.dart';
import 'package:retrofit/http.dart';

part "journey_api.g.dart";

@RestApi()
abstract class JourneyApi {
  factory JourneyApi(Dio dio, {String baseUrl}) = _JourneyApi;

  @GET("/areas")
  Future<ApiResponse<List<AreaResponse>>> fetchListArea();

  @POST("/completed-area")
  Future<ApiResponse<String>> completeArea(@Body() CompleteAreaRequest completeAreaRequest);

  @GET("/completed-area/list")
  Future<ApiResponse<List<AreaCompletedResponse>>> fetchListAreaCompleted();

  @GET("/gifts")
  Future<ApiResponse<List<GiftResponse>>> fetchListGift(@Part(name: 'type') int typeGift);

  @POST("/received-gift")
  Future<ApiResponse<String>> receivedGift(@Body() ReceiveGiftRequest receiveGiftRequest);
}
