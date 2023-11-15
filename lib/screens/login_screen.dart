import 'package:flutter/material.dart';

import '../components/auth_form_component.dart';
import '../components/text_button_component.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              Expanded(
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
