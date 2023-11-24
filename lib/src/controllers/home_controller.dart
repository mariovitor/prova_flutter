import 'package:mobx/mobx.dart';
import 'package:prova_flutter/src/controllers/login_controller.dart';
import 'package:prova_flutter/src/core/core.dart';
import 'package:prova_flutter/src/domain/repositories/user_repository.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  HomeControllerBase() {
    texts.addAll(_loginController.user?.texts ?? <String>[]);
  }
  final _userRepository = getIt<UserRepository>();
  final _loginController = getIt<LoginController>();

  final texts = ObservableList<String>();

  @action
  void deleteText(int index) {
    final user = _loginController.user;
    if (user == null) return;
    texts.removeAt(index);
    _userRepository.saveUserTexts(user.copyWith(texts: texts));
  }

  @action
  void addText(String value, {int? index}) {
    final user = _loginController.user;
    if (user == null) return;
    if (index == null) {
      texts.add(value);
    } else {
      texts[index] = value;
    }
    _userRepository.saveUserTexts(user.copyWith(texts: texts));
  }
}
