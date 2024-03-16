import "package:get_it/get_it.dart";
import "package:jotub_app/core/preferences/shared_preferences_manager.dart";

GetIt getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _registerAppPreference();
}

Future _registerAppPreference() async {
  final pref = await SharedPreferencesManager.getInstance();
  getIt.registerSingleton(pref);
}
