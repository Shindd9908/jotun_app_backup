import 'dart:io';

import 'package:fcm_config/fcm_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:jotub_app/core/preferences/shared_preferences_manager.dart';
import 'package:jotub_app/di/dependency_injection.dart';
import 'package:jotub_app/utils/constants/key_preferences.dart';

Future<void> receiveFirebaseMessagingBackground(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class InitFirebaseConfigs {
  final sharedPreference = getIt<SharedPreferencesManager>();
  Future<void> configFirebaseMessaging() async {
    final messaging = FirebaseMessaging.instance;

    FirebaseMessaging.onBackgroundMessage(receiveFirebaseMessagingBackground);

    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      if (token != null) {
        debugPrint('token : $token');
        sharedPreference.putValue(KeyPreferences.kDeviceToken, token);
      }
    });

    final settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      debugPrint('User granted provisional permission');
    } else {
      debugPrint('User declined or has not accepted permission');
    }

    const channel = AndroidNotificationChannel(
      'high_importance_channel',
      'JT Jotashield',
      importance: Importance.high,
      playSound: true,
    );

    await FCMConfig.instance.init(
      defaultAndroidChannel: channel,
      defaultAndroidForegroundIcon: '@mipmap/launcher_icon',
      displayInForeground: (notification) => false,
    );

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channel.id,
      channel.name,
      playSound: true,
      icon: '@mipmap/launcher_icon',
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: null,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final notification = message.notification;
      debugPrint(notification?.title.toString());

      if (Platform.isAndroid) {
        await flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification?.title ?? '',
          notification?.body ?? '',
          platformChannelSpecifics,
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      final notification = message.notification;
      debugPrint(notification?.title.toString());
    });
  }
}
