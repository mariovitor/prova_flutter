import 'package:prova_flutter/src/data/remote/remote_datasource.dart';
import 'package:prova_flutter/src/domain/models/user_model.dart';

class RemoteDatasourceMock implements RemoteDataSource {
  @override
  Future<UserModel> login(String userName, String password) async {
    await Future.delayed(const Duration(seconds: 3));
    return UserModel(userName: userName, password: password);
  }
}
