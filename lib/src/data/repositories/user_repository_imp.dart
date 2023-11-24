import 'package:prova_flutter/src/data/local/local_datasource.dart';
import 'package:prova_flutter/src/data/remote/remote_datasource.dart';
import 'package:prova_flutter/src/domain/models/user_model.dart';

import '../../domain/repositories/user_repository.dart';

class UserRepositoryImp implements UserRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDatasource _localDatasource;

  UserRepositoryImp(this._remoteDataSource, this._localDatasource);

  @override
  Future<UserModel> login(String userName, String password) async {
    UserModel user = await _remoteDataSource.login(userName, password);
    return await _localDatasource.getUserTexts(user);
  }

  @override
  Future<void> saveUserTexts(UserModel user) async {
    await _localDatasource.saveUserTopics(user);
  }
}
