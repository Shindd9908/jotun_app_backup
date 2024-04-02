import "package:fcm_config/fcm_config.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:jotub_app/core/firebase/init_firebase_configs.dart";
import "package:jotub_app/features/authentication/presentation/bloc/authentication_bloc.dart";
import "package:jotub_app/features/authentication/presentation/cubit/firebase_token_cubit.dart";
import "package:jotub_app/features/home/presentation/bloc/home_bloc.dart";
import "package:jotub_app/features/journey/presentation/bloc/journey_bloc.dart";
import "package:jotub_app/features/mini_game/presentation/bloc/mini_game_bloc.dart";
import "package:jotub_app/features/new_products/presentation/bloc/new_products_bloc.dart";
import "package:jotub_app/features/notification/presentation/bloc/notification_bloc.dart";
import "package:jotub_app/utils/constants/constants.dart";
import "package:jotub_app/utils/routers/navigation_util.dart";
import "package:jotub_app/utils/routers/routers.dart";
import "package:sizer/sizer.dart";

import "di/dependency_injection.dart";
import "firebase_options.dart";
import "generated/l10n.dart";

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initDependencies();
  await InitFirebaseConfigs().configFirebaseMessaging();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AuthenticationBloc>()),
        BlocProvider(create: (_) => getIt<FirebaseTokenCubit>()),
        BlocProvider(create: (_) => getIt<HomeBloc>()),
        BlocProvider(create: (_) => getIt<MiniGameBloc>()),
        BlocProvider(create: (_) => getIt<JourneyBloc>()),
        BlocProvider(create: (_) => getIt<NewProductsBloc>()),
        BlocProvider(create: (_) => getIt<NotificationBloc>()),
      ],
      child: KeyboardDismissOnTap(
        child: Sizer(
          builder: (_, __, ___) => MaterialApp(
            title: Constants.kDefaultAppName,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationUtil.rootKey,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              S.delegate,
            ],
            locale: const Locale(Constants.kDefaultLanguage),
            supportedLocales: S.delegate.supportedLocales,
            onGenerateRoute: (route) => AppRoutes.generateRoute(route),
          ),
        ),
      ),
    );
  }
}
