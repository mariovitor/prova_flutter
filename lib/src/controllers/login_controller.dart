import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:prova_flutter/main.dart';
import 'package:prova_flutter/src/core/core.dart';
import 'package:prova_flutter/src/domain/models/user_model.dart';
import 'package:prova_flutter/src/domain/repositories/user_repository.dart';

part 'login_controller.g.dart';

enum LoginState { initial, loading, error, success }

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final _userRepository = getIt<UserRepository>();

  @observable
  UserModel? user;

  @observable
  LoginState state = LoginState.initial;

  @action
  void changeState(LoginState s) {
    state = s;
  }

  @action
  Future<void> login(String username, String password) async {
    try {
      changeState(LoginState.loading);
      user = await _userRepository.login(username, password);
      changeState(LoginState.success);
    } catch (e) {
      log(e.toString());
      changeState(LoginState.error);
    }
  }

  @action
  void refreshUser(UserModel u) {
    try {
      _userRepository.saveUserTexts(u).then((value) => user = u);
    } catch (e) {
      log(e.toString());
      messengerKey.currentState?.showSnackBar(
        const SnackBar(
          content: Text('Erro ao salvar os textos'),
        ),
      );
    }
  }
}
