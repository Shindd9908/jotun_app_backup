import "package:flutter/material.dart";
import "package:jotub_app/features/authentication/presentation/ui/screens/login_screen.dart";
import "package:jotub_app/features/authentication/presentation/ui/screens/select_object_use_screen.dart";
import "package:jotub_app/utils/routers/paths.dart";

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppPaths.selectObjectUseScreen:
        return MaterialPageRoute(builder: (_) => const SelectObjectUseScreen());
      case AppPaths.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SelectObjectUseScreen());
    }
  }
}
