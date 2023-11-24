import 'package:prova_flutter/src/domain/models/user_model.dart';

abstract interface class RemoteDataSource {
  Future<UserModel> login(String userName, String password);
}
