import 'package:flutter/material.dart';
import '../screens/OnBoarding_Screen.dart';
import '../screens/beforeOnBoarding_Screen.dart';
import 'app_routes.dart';


class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
        case AppRoutes.beforeOnBoarding:
        return MaterialPageRoute(
          builder: (_) => const BeforeonboardingScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("No Route Found"),

            ),
          ),
        );
    }
  }
}