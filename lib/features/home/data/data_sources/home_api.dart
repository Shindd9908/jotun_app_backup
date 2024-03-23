import "package:dio/dio.dart";
import "package:jotub_app/core/models/api_response.dart";
import "package:jotub_app/features/home/data/models/banner_response.dart";
import "package:retrofit/http.dart";

part "home_api.g.dart";

@RestApi()
abstract class HomeApi {
  factory HomeApi(Dio dio, {String baseUrl}) = _HomeApi;

  @GET("/banners")
  Future<ApiResponse<List<BannerResponse>>> fetchListBanner();
}
