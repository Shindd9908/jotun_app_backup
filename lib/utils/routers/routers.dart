import "package:flutter/cupertino.dart";

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      default:
        return CupertinoPageRoute(builder: (_) => const Text("error"));
    }
  }
}
