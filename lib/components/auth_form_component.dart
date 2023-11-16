import 'package:flutter/material.dart';
import 'package:login_app/stores/form_store.dart';
import 'package:login_app/utils/app_routes.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AuthFormComponent extends StatelessWidget {
  const AuthFormComponent({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userController = TextEditingController();

    TextEditingController passwordController = TextEditingController();

    FormStore formStore = FormStore();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'Usuário',
                  style: TextStyle(
                    color: Colors.grey[50],
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
              Observer(
                builder: (context) {
                  return TextField(
                    controller: userController,
                    onChanged: (value) => formStore.setUsername(value),
                    decoration: InputDecoration(
                      filled: true,
                      errorText: formStore.loginError,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'Senha',
                  style: TextStyle(
                    color: Colors.grey[50],
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
              Observer(
                builder: (context) {
                  return TextField(
                    onChanged: (value) => formStore.setPassword(value),
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      errorText: formStore.passwordError,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: const Icon(
                        Icons.lock_sharp,
                        color: Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff44BD6E),
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
          ),
          onPressed: () => Navigator.of(context).pushNamed(AppRoutes.info),
          child: const Text(
            'Entrar',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
