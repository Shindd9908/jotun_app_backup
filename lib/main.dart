import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:jotub_app/features/authentication/presentation/manager/sign_in_bloc.dart";
import "package:jotub_app/utils/constants/constants.dart";
import "package:jotub_app/utils/global_widgets/custom_flushbar/custom_flush_bar.dart";

import "di/dependency_injection.dart";
import "features/networking/network_cubit.dart";
import "generated/l10n.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<SignInBloc>()),
      ],
      child: KeyboardDismissOnTap(
        child: ScreenUtilInit(
          designSize: const Size(393, 852),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            SystemChrome.setPreferredOrientations(
              [DeviceOrientation.portraitUp],
            );
            return MaterialApp(
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
              home: BlocProvider(
                create: (context) => NetworkCubit(),
                child: const MyHomePage(title: "Flutter Demo Home Page"),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SignInBloc>().add(
          const SignInWithEmailEvent(
            username: "0961783723",
            password: "Jotun123",
            roleUser: 3,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: BlocListener<NetworkCubit, NetworkState>(
        listener: (context, state) {
          if (state is NetworkDisconnected) {
            //CustomFlushBar.showFailed(context, "Mât mẹ nó mạng rồi!");
          }
        },
        child: BlocListener<SignInBloc, SignInState>(
          listenWhen: (context, current) => current is SignInLoading || current is SignInSuccess || current is SignInFailed,
          listener: (context, state) {
            if (state is SignInSuccess) {
              CustomFlushBar.showFailed(context, state.userInfoEntity.name ?? "khang");
            } else if (state is SignInFailed) {
              CustomFlushBar.showFailed(context, state.errorMessage);
            }
          },
          child: const Center(
            child: Text("Your Content"),
          ),
        ),
      ),
    );
  }
}
