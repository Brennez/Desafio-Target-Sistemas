import 'package:flutter/material.dart';
import 'package:login_app/components/auth_form_component.dart';
import 'package:login_app/components/text_button_component.dart';

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
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xff20596A),
                Color(0xff2A8985),
              ])),
          child: Column(
            children: [
              const Expanded(
                flex: 8,
                child: AuthFormComponent(),
              ),
              Expanded(
                flex: 1,
                child: TextButtonComponent(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
