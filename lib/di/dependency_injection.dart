import "package:dio/dio.dart";
import "package:get_it/get_it.dart";
import "package:jotub_app/core/app_configs.dart";
import "package:jotub_app/core/interceptor/app_dio_interceptor.dart";
import "package:jotub_app/core/preferences/shared_preferences_manager.dart";
import "package:jotub_app/features/authentication/data/data_sources/authentication_api.dart";
import "package:jotub_app/features/authentication/data/repositories/user_authentication_repository_impl.dart";
import "package:jotub_app/features/authentication/domain/repositories/user_authentication_repository.dart";
import "package:jotub_app/features/authentication/presentation/bloc/authentication_bloc.dart";
import "package:jotub_app/features/authentication/presentation/cubit/firebase_token_cubit.dart";
import "package:jotub_app/features/home/data/data_sources/home_api.dart";
import "package:jotub_app/features/home/data/repositories/home_repository_impl.dart";
import "package:jotub_app/features/home/domain/repositories/home_repository.dart";
import "package:jotub_app/features/home/presentation/bloc/home_bloc.dart";
import "package:jotub_app/features/journey/data/data_source/journey_api.dart";
import "package:jotub_app/features/journey/data/repositories/journey_repository_impl.dart";
import "package:jotub_app/features/journey/domain/repositories/journey_repository.dart";
import "package:jotub_app/features/journey/presentation/bloc/journey_bloc.dart";
import "package:jotub_app/features/mini_game/data/data_sources/mini_game_api.dart";
import "package:jotub_app/features/mini_game/data/repositories/mini_game_repository_impl.dart";
import "package:jotub_app/features/mini_game/domain/repositories/mini_game_repository.dart";
import "package:jotub_app/features/mini_game/presentation/bloc/mini_game_bloc.dart";
import "package:jotub_app/features/new_products/data/data_source/new_products_api.dart";
import "package:jotub_app/features/new_products/data/repositories/new_product_repository_impl.dart";
import "package:jotub_app/features/new_products/domain/repositories/new_products_repository.dart";
import "package:jotub_app/features/new_products/presentation/bloc/new_products_bloc.dart";
import "package:jotub_app/features/notification/data/data_sources/notification_api.dart";
import "package:jotub_app/features/notification/data/repositories/notification_repository_impl.dart";
import "package:jotub_app/features/notification/domain/repositories/notification_repository.dart";
import "package:jotub_app/features/notification/presentation/bloc/notification_bloc.dart";

GetIt getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _registerAppPreference();
  _registerAppNetworkComponents();
  _registerRepository();
  _registerBlocs();
  _registerCubit();
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
  getIt.registerSingleton(HomeApi(dio, baseUrl: dio.options.baseUrl));
  getIt.registerSingleton(JourneyApi(dio, baseUrl: dio.options.baseUrl));
  getIt.registerSingleton(MiniGameApi(dio, baseUrl: dio.options.baseUrl));
  getIt.registerSingleton(NewProductsApi(dio, baseUrl: dio.options.baseUrl));
  getIt.registerSingleton(NotificationApi(dio, baseUrl: dio.options.baseUrl));
}

void _registerRepository() {
  getIt.registerFactory<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      authenticationApi: getIt<AuthenticationApi>(),
      sharedPreferencesManager: getIt<SharedPreferencesManager>(),
    ),
  );

  getIt.registerFactory<HomeRepository>(
    () => HomeRepositoryImpl(
      homeApi: getIt<HomeApi>(),
    ),
  );

  getIt.registerFactory<MiniGameRepository>(
    () => MiniGameRepositoryImpl(
      miniGameApi: getIt<MiniGameApi>(),
    ),
  );

  getIt.registerFactory<JourneyRepository>(
    () => JourneyRepositoryImpl(
      journeyApi: getIt<JourneyApi>(),
    ),
  );

  getIt.registerFactory<NewProductsRepository>(
    () => NewProductsRepositoryImpl(
      newProductsApi: getIt<NewProductsApi>(),
    ),
  );

  getIt.registerFactory<NotificationRepository>(
    () => NotificationRepositoryImpl(notificationApi: getIt<NotificationApi>()),
  );
}

void _registerBlocs() {
  getIt.registerLazySingleton<AuthenticationBloc>(
    () => AuthenticationBloc(
      authenticationRepository: getIt<AuthenticationRepository>(),
    ),
  );

  getIt.registerLazySingleton<HomeBloc>(
    () => HomeBloc(
      homeRepository: getIt<HomeRepository>(),
    ),
  );

  getIt.registerLazySingleton<MiniGameBloc>(
    () => MiniGameBloc(
      miniGameRepository: getIt<MiniGameRepository>(),
    ),
  );

  getIt.registerLazySingleton<JourneyBloc>(
    () => JourneyBloc(
      journeyRepository: getIt<JourneyRepository>(),
    ),
  );

  getIt.registerLazySingleton<NewProductsBloc>(
    () => NewProductsBloc(
      newProductsRepository: getIt<NewProductsRepository>(),
    ),
  );

  getIt.registerLazySingleton<NotificationBloc>(
    () => NotificationBloc(notificationRepository: getIt<NotificationRepository>()),
  );
}

void _registerCubit() {
  getIt.registerLazySingleton<FirebaseTokenCubit>(() => FirebaseTokenCubit());
}
