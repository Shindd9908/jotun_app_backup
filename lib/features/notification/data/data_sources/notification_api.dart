import 'package:dio/dio.dart';
import 'package:jotub_app/core/models/api_response.dart';
import 'package:jotub_app/features/notification/data/models/response/notification_data_model.dart';
import 'package:retrofit/http.dart';

part 'notification_api.g.dart';

@RestApi()
abstract class NotificationApi {
  factory NotificationApi(Dio dio, {String baseUrl}) = _NotificationApi;

  @GET("/notifications")
  Future<ApiResponse<NotificationDataModel>> getListNotification();
}
