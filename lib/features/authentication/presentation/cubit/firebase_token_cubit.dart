import 'package:fcm_config/fcm_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jotub_app/core/preferences/shared_preferences_manager.dart';
import 'package:jotub_app/di/dependency_injection.dart';
import 'package:jotub_app/utils/constants/key_preferences.dart';

class FirebaseTokenCubit extends Cubit<String?> {
  FirebaseTokenCubit() : super(null);

  void checkAndGenerateDeviceToken() async {
    final sharedPreference = getIt<SharedPreferencesManager>();
    String? deviceToken = sharedPreference.getValue(KeyPreferences.kDeviceToken);
    if (deviceToken == null) {
      deviceToken = await FirebaseMessaging.instance.getToken();
      sharedPreference.putValue(KeyPreferences.kDeviceToken, deviceToken);
    }
    emit(deviceToken);
  }
}
