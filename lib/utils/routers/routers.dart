import "package:flutter/material.dart";
import "package:jotub_app/features/authentication/presentation/ui/screens/login_screen.dart";
import "package:jotub_app/features/authentication/presentation/ui/screens/select_object_use_screen.dart";
import "package:jotub_app/features/home/presentation/ui/screens/home_screen.dart";
import "package:jotub_app/features/home/presentation/ui/screens/splash_screen.dart";
import "package:jotub_app/features/journey/presentation/ui/screens/journey_screen.dart";
import "package:jotub_app/features/schedule/presentation/ui/screens/schedule_screen.dart";
import "package:jotub_app/features/trip/presentation/ui/screens/trip_screen.dart";
import "package:jotub_app/utils/routers/paths.dart";

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppPaths.selectObjectUseScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppPaths.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppPaths.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppPaths.tripScreen:
        return MaterialPageRoute(builder: (_) => const TripScreen());
      case AppPaths.scheduleScreen:
        return MaterialPageRoute(builder: (_) => const ScheduleScreen());
      case AppPaths.journeyScreen:
        return MaterialPageRoute(builder: (_) => const JourneyScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SelectObjectUseScreen());
    }
  }
}
