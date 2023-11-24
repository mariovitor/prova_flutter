// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:prova_flutter/src/presentation/login/widgets/custom_form_field.dart';
import 'package:prova_flutter/src/presentation/login/widgets/privacy_button.dart';

import '../../../core/core.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
    required this.onSubmit,
    this.userNameController,
    this.passwordCcontroller,
  }) : super(key: key);

  final Function(String username, String password) onSubmit;
  final TextEditingController? userNameController;
  final TextEditingController? passwordCcontroller;
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  late final usernameController =
      widget.userNameController ?? TextEditingController();
  late final passwordController =
      widget.passwordCcontroller ?? TextEditingController();
  final passwordFocusNode = FocusNode();

  void onSubmit() {
    if (formKey.currentState!.validate()) {
      widget.onSubmit(
        usernameController.text,
        passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.95,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                CustomFormField(
                  label: 'Usuário',
                  controller: usernameController,
                  validator: AppValidators.validateUsername,
                  icon: Icons.person,
                  onSubmitted: (_) {
                    passwordFocusNode.requestFocus();
                  },
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  label: 'Senha',
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                  validator: AppValidators.validatePassword,
                  obscureText: true,
                  icon: Icons.lock,
                  onSubmitted: (_) => onSubmit(),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        onPressed: onSubmit,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32.0),
                          child: Text('Entrar'),
                        )),
                  ],
                ),
                const Spacer(),
                const PrivacyButton(),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
