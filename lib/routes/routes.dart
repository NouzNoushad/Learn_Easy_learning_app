import 'package:flutter/material.dart';
import 'package:learning_app/presentation/auth/layout/login_layout.dart';
import 'package:learning_app/presentation/auth/layout/sign_up_layout.dart';
import 'package:learning_app/presentation/learning_home/layout/learning_home.dart';
import 'package:learning_app/presentation/learning_modules/layout/learning_modules.dart';
import 'package:learning_app/presentation/splash_screen/layout/splash_layout.dart';
import 'package:learning_app/routes/routes_constant.dart';
import 'package:learning_app/utils/colors.dart';

class LearningRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.splash:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.splash),
            builder: (context) => const SplashLayout());
      case RouteConstant.login:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.login),
            builder: (context) => const LoginLayout());
      case RouteConstant.signUp:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.signUp),
            builder: (context) => const SignUpLayout());
      case RouteConstant.learningHome:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.learningHome),
            builder: (context) => const LearningHomeScreen());
      case RouteConstant.modules:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.modules),
            builder: (context) => LearningModules(
                  chapter: settings.arguments as Map,
                ));
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  backgroundColor: ColorPicker.backgroundColor,
                  body: Center(child: Text('Page not found')),
                ));
    }
  }
}
