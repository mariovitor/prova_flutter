import 'package:prova_flutter/src/data/local/local_datasource.dart';
import 'package:prova_flutter/src/domain/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatasourceSharedPrefs implements LocalDatasource {
  late final SharedPreferences prefs;
  @override
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<UserModel> getUserTexts(UserModel user) {
    final texts = prefs.getStringList(user.userName) ?? <String>[];
    return Future.value(user.copyWith(texts: texts));
  }

  @override
  Future<bool> saveUserTopics(UserModel user) async {
    try {
      await prefs.setStringList(user.userName, user.texts);
      return true;
    } catch (e) {
      return false;
    }
  }
}
