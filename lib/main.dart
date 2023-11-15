import 'package:flutter/material.dart';
import 'package:login_app/screens/informations_screen.dart';
import 'package:login_app/utils/app_routes.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff20596A)),
        useMaterial3: true,
      ),
      routes: {
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.info: (context) => InformationsScreen(),
      },
      initialRoute: AppRoutes.login,
    );
  }
}
