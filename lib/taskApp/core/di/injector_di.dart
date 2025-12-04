import 'package:get_it/get_it.dart';
import 'package:teste_target_sistemas/taskApp/core/dao/task_dao.dart';
import 'package:teste_target_sistemas/taskApp/core/dao/user_dao.dart';
import 'package:teste_target_sistemas/taskApp/stores/home_store.dart';
import 'package:teste_target_sistemas/taskApp/stores/login_store.dart';

class InjectorDi {
  static Future<void> init() async {
    final inject = GetIt.instance;

    inject.registerLazySingleton<TaskDao>(() => TaskDao());
    inject.registerLazySingleton<UserDao>(() => UserDao());
    inject.registerLazySingleton<HomeStore>(() => HomeStore());
    inject.registerLazySingleton<LoginStore>(() => LoginStore());
  }
}
