import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:jotub_app/features/authentication/presentation/bloc/authentication_bloc.dart";
import "package:jotub_app/features/authentication/presentation/ui/screens/login_screen.dart";
import "package:jotub_app/utils/constants/constants.dart";
import "package:sizer/sizer.dart";

import "di/dependency_injection.dart";
import "generated/l10n.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
            home: const LoginScreen(),
          ),
        ),
      ),
    );
  }
}
