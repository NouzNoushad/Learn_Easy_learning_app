import 'package:flutter/material.dart';
import 'package:learning_app/routes/routes_constant.dart';
import 'package:learning_app/utils/colors.dart';
import 'package:learning_app/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashLayout extends StatefulWidget {
  const SplashLayout({super.key});

  @override
  State<SplashLayout> createState() => _SplashLayoutState();
}

class _SplashLayoutState extends State<SplashLayout> {
  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      if (await isLoggedIn()) {
        print('home');
        Navigator.of(context).pushNamed(RouteConstant.learningHome);
      } else {
        Navigator.of(context).pushNamed(RouteConstant.login);
      }
    });
    super.initState();
  }

  Future<bool> isLoggedIn() async {
    sharedPreferences = await SharedPreferences.getInstance();
    bool loggedIn = sharedPreferences.containsKey(tokenName);
    print('//////////////////// loggedIn : $loggedIn');
    return loggedIn;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorPicker.backgroundColor,
      body: Center(
          child: Text(
        'Learn Easy',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color: ColorPicker.primaryColor,
        ),
      )),
    );
  }
}
