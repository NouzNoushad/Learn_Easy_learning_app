import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/data/blocs/widget/bloc_wrapper.dart';
import 'package:learning_app/routes/routes.dart';
import 'package:learning_app/routes/routes_constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocWidget(
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lime),
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: LearningRoutes.onGenerateRoute,
        initialRoute: RouteConstant.splash,
      ),
    );
  }
}
