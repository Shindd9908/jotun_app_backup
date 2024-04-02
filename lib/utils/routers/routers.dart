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
import "package:jotub_app/features/journey/presentation/ui/screens/answer_question_screen.dart";
import "package:jotub_app/features/journey/presentation/ui/screens/journey_screen.dart";
import "package:jotub_app/features/journey/presentation/ui/screens/receive_gift_journey_screen.dart";
import "package:jotub_app/features/journey/presentation/ui/screens/scan_qr_code_screen.dart";
import "package:jotub_app/features/mini_game/presentation/ui/screens/gift_screen.dart";
import "package:jotub_app/features/mini_game/presentation/ui/screens/introduce_mini_game_screen.dart";
import "package:jotub_app/features/mini_game/presentation/ui/screens/mini_game_screen.dart";
import "package:jotub_app/features/mini_game/presentation/ui/screens/result_screen.dart";
import "package:jotub_app/features/new_products/presentation/ui/new_products_screen.dart";
import "package:jotub_app/features/schedule/presentation/ui/screens/schedule_screen.dart";
import "package:jotub_app/features/trip/presentation/ui/screens/trip_screen.dart";
import "package:jotub_app/utils/constants/key_preferences.dart";
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
      case AppPaths.scanQRCodeScreen:
        return MaterialPageRoute(builder: (_) => ScanQRCodeScreen(area: arguments?['area']));
      case AppPaths.answerQuestionScreen:
        return MaterialPageRoute(builder: (_) => AnswerQuestionScreen(area: arguments?['area']));
      case AppPaths.receiveGiftJourneyScreen:
        return MaterialPageRoute(builder: (_) => ReceiveGiftJourneyScreen(giftReceivedURL: arguments?['giftReceivedURL']));
      case AppPaths.introduceMiniGameScreen:
        return MaterialPageRoute(builder: (_) => const IntroduceMiniGameScreen());
      case AppPaths.miniGameScreen:
        return MaterialPageRoute(builder: (_) => const MiniGameScreen());
      case AppPaths.giftScreen:
        return MaterialPageRoute(builder: (_) => const GiftScreen());
      case AppPaths.resultScreen:
        return MaterialPageRoute(
          builder: (_) => ResultScreen(
            isCompleted: arguments?['isCompleted'],
            achievements: arguments?['achievements'],
          ),
        );
      case AppPaths.newProductsScreen:
        return MaterialPageRoute(builder: (_) => const NewProductsScreen());
      default:
        Widget widget = getIt<SharedPreferencesManager>().getValue<bool>(KeyPreferences.kStatusConfirmAccountDone) == true
            ? const HomeScreen()
            : const SelectObjectUseScreen();
        return MaterialPageRoute(builder: (_) => widget);
    }
  }
}
