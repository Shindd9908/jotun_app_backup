import "package:dio/dio.dart";
import "package:get_it/get_it.dart";
import "package:jotub_app/core/app_configs.dart";
import "package:jotub_app/core/interceptor/app_dio_interceptor.dart";
import "package:jotub_app/core/preferences/shared_preferences_manager.dart";
import "package:jotub_app/features/authentication/data/data_sources/authentication_api.dart";
import "package:jotub_app/features/authentication/data/repositories/user_authentication_repository_impl.dart";
import "package:jotub_app/features/authentication/domain/repositories/user_authentication_repository.dart";
import "package:jotub_app/features/authentication/presentation/bloc/authentication_bloc.dart";

GetIt getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _registerAppPreference();
  _registerAppNetworkComponents();
  _registerRepository();
  _registerBlocs();
}

Future<void> _registerAppPreference() async {
  final pref = await SharedPreferencesManager.getInstance();
  getIt.registerSingleton(pref);
}

void _registerAppNetworkComponents() {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConfigs.apiBaseUrl,
      connectTimeout: const Duration(milliseconds: AppConfigs.kConnectApiTimeout),
      receiveTimeout: const Duration(milliseconds: AppConfigs.kReceiveApiTimeout),
      sendTimeout: const Duration(milliseconds: AppConfigs.kSendApiTimeout),
      receiveDataWhenStatusError: true,
    ),
  );
  dio.interceptors.addAll([
    AppDioInterceptor(
      preferencesManager: getIt.get<SharedPreferencesManager>(),
    ),
  ]);

  getIt.registerSingleton(AuthenticationApi(dio, baseUrl: dio.options.baseUrl));
}

void _registerRepository() {
  getIt.registerFactory<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      authenticationApi: getIt<AuthenticationApi>(),
      sharedPreferencesManager: getIt<SharedPreferencesManager>(),
    ),
  );
}

void _registerBlocs() {
  getIt.registerLazySingleton<AuthenticationBloc>(
    () => AuthenticationBloc(
      authenticationRepository: getIt<AuthenticationRepository>(),
    ),
  );
}
