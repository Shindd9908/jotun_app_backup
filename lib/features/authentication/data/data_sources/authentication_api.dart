import "package:dio/dio.dart";
import "package:jotub_app/core/models/api_response.dart";
import "package:jotub_app/features/authentication/data/models/login_request.dart";
import "package:jotub_app/features/authentication/data/models/user_login_response.dart";
import "package:retrofit/http.dart";

part "authentication_api.g.dart";

@RestApi()
abstract class AuthenticationApi {
  factory AuthenticationApi(Dio dio, {String baseUrl}) = _AuthenticationApi;

  @POST("/login")
  Future<ApiResponse<UserLoginResponse>> login(
    @Body() LoginRequest loginRequest,
  );

  @POST("/logout")
  Future<ApiResponse> logOut();
}
