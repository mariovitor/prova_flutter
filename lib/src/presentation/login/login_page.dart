import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:prova_flutter/src/controllers/login_controller.dart';
import 'package:prova_flutter/src/core/core.dart';

import 'package:prova_flutter/src/presentation/login/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const pageName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = LoginController();

  @override
  void initState() {
    super.initState();
    reaction<LoginController>(
      (c) => loginController,
      (c) {
        if (c.state == LoginState.success) {
          Navigator.of(context).pushReplacementNamed('/home'); //TODO
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryGreen,
              AppColors.secondaryGreen,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Observer(builder: (context) {
                  return switch (loginController.state) {
                    _ when loginController.state == LoginState.loading =>
                      const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.white,
                      )),
                    _ when loginController.state == LoginState.initial =>
                      LoginForm(onSubmit: loginController.login),
                    _ => const SizedBox.shrink(),
                  };
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
