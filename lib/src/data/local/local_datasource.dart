import 'package:prova_flutter/src/domain/models/user_model.dart';

abstract interface class LocalDatasource {
  Future<void> init();
  Future<bool> saveUserTopics(UserModel user);
  Future<UserModel> getUserTexts(UserModel user);
}
