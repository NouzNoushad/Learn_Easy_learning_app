import 'package:flutter/material.dart';
import 'package:learning_app/routes/routes_constant.dart';
import 'package:learning_app/utils/colors.dart';

class SplashLayout extends StatefulWidget {
  const SplashLayout({super.key});

  @override
  State<SplashLayout> createState() => _SplashLayoutState();
}

class _SplashLayoutState extends State<SplashLayout> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushNamed(RouteConstant.login);
    });
    super.initState();
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
