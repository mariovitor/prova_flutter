import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

enum LoginState { initial, loading, error, success }

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  @observable
  LoginState state = LoginState.initial;

  @action
  void changeState(LoginState s) {
    state = s;
  }

  @action
  Future<void> login(String username, String password) async {
    changeState(LoginState.loading);
    await Future.delayed(const Duration(seconds: 3));
    changeState(LoginState.success);
  }
}
