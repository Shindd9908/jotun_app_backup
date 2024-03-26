import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:jotub_app/features/authentication/presentation/bloc/authentication_bloc.dart";
import "package:jotub_app/features/home/presentation/bloc/home_bloc.dart";
import "package:jotub_app/features/mini_game/presentation/bloc/mini_game_bloc.dart";
import "package:jotub_app/features/mini_game/presentation/ui/screens/introduce_mini_game.dart";
import "package:jotub_app/features/schedule/presentation/ui/screens/schedule_screen.dart";
import "package:jotub_app/features/trip/presentation/ui/screens/trip_screen.dart";
import "package:jotub_app/utils/constants/constants.dart";
import "package:jotub_app/utils/routers/routers.dart";
import "package:sizer/sizer.dart";

import "di/dependency_injection.dart";
import "firebase_options.dart";
import "generated/l10n.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AuthenticationBloc>()),
        BlocProvider(create: (_) => getIt<HomeBloc>()),
        BlocProvider(create: (_) => getIt<MiniGameBloc>()),
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
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              S.delegate,
            ],
            locale: const Locale(Constants.kDefaultLanguage),
            supportedLocales: S.delegate.supportedLocales,
            home: IntroduceMiniGame(),
            // onGenerateRoute: (route) => AppRoutes.generateRoute(route),
          ),
        ),
      ),
    );
  }
}
