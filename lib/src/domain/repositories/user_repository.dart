import 'package:prova_flutter/src/domain/models/user_model.dart';

abstract interface class UserRepository {
  Future<UserModel> login(String userName, String password);
  Future<void> saveUserTexts(UserModel user);
}
