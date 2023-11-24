import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:prova_flutter/src/controllers/login_controller.dart';
import 'package:prova_flutter/src/core/core.dart';
import 'package:prova_flutter/src/presentation/home/home_page.dart';

import 'package:prova_flutter/src/presentation/login/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const pageName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = getIt<LoginController>();
  final userNameController = TextEditingController();
  final passwordCcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    reaction<LoginState>(
      (s) => loginController.state,
      (s) {
        if (s == LoginState.success) {
          Navigator.of(context).pushReplacementNamed(HomePage.pageName);
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
                  return switch (loginController) {
                    _ when loginController.state == LoginState.loading =>
                      const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.white,
                      )),
                    _ when loginController.state == LoginState.initial =>
                      LoginForm(onSubmit: loginController.login),
                    _ => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Erro ao fazer login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                loginController.changeState(LoginState.initial),
                            child: const Text(
                              'Tentar novamente',
                              style: TextStyle(
                                color: AppColors.yellow,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
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
