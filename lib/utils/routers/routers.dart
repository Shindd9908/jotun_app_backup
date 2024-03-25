import "package:flutter/material.dart";
import "package:jotub_app/core/preferences/shared_preferences_manager.dart";
import "package:jotub_app/di/dependency_injection.dart";
import "package:jotub_app/features/authentication/presentation/ui/screens/change_password_screen.dart";
import "package:jotub_app/features/authentication/presentation/ui/screens/confirm_account_information_screen.dart";
import "package:jotub_app/features/authentication/presentation/ui/screens/login_screen.dart";
import "package:jotub_app/features/authentication/presentation/ui/screens/select_object_use_screen.dart";
import "package:jotub_app/features/home/presentation/ui/screens/home_screen.dart";
import "package:jotub_app/features/home/presentation/ui/screens/profile_screen.dart";
import "package:jotub_app/features/home/presentation/ui/screens/splash_screen.dart";
import "package:jotub_app/features/journey/presentation/ui/screens/journey_screen.dart";
import "package:jotub_app/features/mini_game/presentation/ui/screens/introduce_mini_game.dart";
import "package:jotub_app/features/mini_game/presentation/ui/screens/mini_game_screen.dart";
import "package:jotub_app/features/schedule/presentation/ui/screens/schedule_screen.dart";
import "package:jotub_app/features/trip/presentation/ui/screens/trip_screen.dart";
import "package:jotub_app/utils/routers/paths.dart";

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case AppPaths.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen(userRole: arguments?['userRole']));
      case AppPaths.changePasswordScreen:
        return MaterialPageRoute(builder: (_) => ChangePasswordScreen(userRole: arguments?['userRole']));
      case AppPaths.confirmAccountInformationScreen:
        return MaterialPageRoute(builder: (_) => ConfirmAccountInformationScreen(userInfo: arguments?['userInfo']));
      case AppPaths.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppPaths.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppPaths.profileScreen:
        return MaterialPageRoute(builder: (_) => ProfileScreen(userInfo: arguments?['userInfo']));
      case AppPaths.tripScreen:
        return MaterialPageRoute(builder: (_) => const TripScreen());
      case AppPaths.scheduleScreen:
        return MaterialPageRoute(builder: (_) => const ScheduleScreen());
      case AppPaths.journeyScreen:
        return MaterialPageRoute(builder: (_) => const JourneyScreen());
      case AppPaths.introduceMiniGameScreen:
        return MaterialPageRoute(builder: (_) => const IntroduceMiniGame());
      case AppPaths.miniGameScreen:
        return MaterialPageRoute(builder: (_) => const MiniGameScreen());
      default:
        Widget widget = getIt<SharedPreferencesManager>().getValue<bool>(KeyPreference.kStatusConfirmAccountDone) == true
            ? const SplashScreen()
            : const SelectObjectUseScreen();
        return MaterialPageRoute(builder: (_) => widget);
    }
  }
}
