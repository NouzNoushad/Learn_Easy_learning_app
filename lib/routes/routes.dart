import 'package:flutter/material.dart';
import 'package:learning_app/presentation/learning_home/layout/learning_home.dart';
import 'package:learning_app/presentation/learning_modules/layout/learning_modules.dart';
import 'package:learning_app/routes/routes_constant.dart';
import 'package:learning_app/utils/colors.dart';

class LearningRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.learningHome:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.learningHome),
            builder: (context) => const LearningHomeScreen());
      case RouteConstant.modules:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.modules),
            builder: (context) => LearningModules(chapter: settings.arguments as Map,));
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  backgroundColor: ColorPicker.backgroundColor,
                  body: Center(child: Text('Page not found')),
                ));
    }
  }
}
