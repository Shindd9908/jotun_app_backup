import 'package:dio/dio.dart';
import 'package:jotub_app/core/models/api_response.dart';
import 'package:jotub_app/features/journey/data/models/area_response.dart';
import 'package:retrofit/http.dart';

part "journey_api.g.dart";

@RestApi()
abstract class JourneyApi {
  factory JourneyApi(Dio dio, {String baseUrl}) = _JourneyApi;

  @GET("/areas")
  Future<ApiResponse<List<AreaResponse>>> fetchListArea();
}