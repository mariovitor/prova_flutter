import 'package:get_it/get_it.dart';
import 'package:prova_flutter/src/controllers/login_controller.dart';
import 'package:prova_flutter/src/data/local/local_datasource.dart';
import 'package:prova_flutter/src/data/local/local_datasource_shared_prefs.dart';
import 'package:prova_flutter/src/data/remote/remote_datasource.dart';
import 'package:prova_flutter/src/data/remote/remote_datasource_mock.dart';
import 'package:prova_flutter/src/data/repositories/user_repository_imp.dart';
import 'package:prova_flutter/src/domain/repositories/user_repository.dart';

GetIt get getIt => GetIt.instance;

abstract class Locator {
  /// Note: remember to call 'await [initDependencies]' in [main.dart]
  static Future<void> init() async {
    await initDataSources();
    await initRepositories();
    await initControllers();
  }

  static Future<void> initDataSources() async {
    getIt.registerSingleton<RemoteDataSource>(RemoteDatasourceMock());
    await getIt
        .registerSingleton<LocalDatasource>(LocalDatasourceSharedPrefs())
        .init();
  }

  static Future<void> initRepositories() async {
    getIt.registerFactory<UserRepository>(
        () => UserRepositoryImp(getIt(), getIt()));
  }

  static Future<void> initControllers() async {
    getIt.registerSingleton<LoginController>(LoginController());
  }
}
