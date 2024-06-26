import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:jotub_app/core/preferences/shared_preferences_manager.dart";
import "package:jotub_app/utils/constants/key_preferences.dart";
import "package:jotub_app/utils/routers/navigation_util.dart";
import "package:jotub_app/utils/routers/paths.dart";

class AppDioInterceptor extends InterceptorsWrapper {
  final SharedPreferencesManager _preferencesManager;

  AppDioInterceptor({
    required SharedPreferencesManager preferencesManager,
  }) : _preferencesManager = preferencesManager;

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers["Accept"] = "*/*";
    options.headers["Content-Type"] = "application/json";
    final accessToken = _preferencesManager.getValue<String>(KeyPreferences.kAccessToken);
    if (accessToken != null) {
      options.headers.addAll({"Authorization": "Bearer $accessToken"});
    }
    options.headers.addAll({"Charset": "utf-8"});
    handler.next(options);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    final httpMethod = err.requestOptions.method.toUpperCase();
    final url = err.requestOptions.baseUrl + err.requestOptions.path;
    debugPrint("\tMETHOD: $httpMethod");
    debugPrint("\tURL: $url");

    if (err.response != null) {
      debugPrint("\tStatus code: ${err.response!.statusCode}");
      if (err.response!.statusCode == 401 || err.response!.statusCode == 403) {
        _preferencesManager.clear();
        NavigationUtil.root!.pushNamedAndRemoveUntil(AppPaths.selectObjectUseScreen, (route) => false);
      }
      if (err.response!.data["error"] != null && err.response!.data["error"].isNotEmpty) {
        debugPrint("\tMessages code: ${err.response!.statusMessage}");
      }
    }
    return handler.next(err);
  }
}
