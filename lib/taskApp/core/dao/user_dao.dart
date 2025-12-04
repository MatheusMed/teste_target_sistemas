import 'package:teste_target_sistemas/taskApp/core/database/database_instance.dart';
import 'package:teste_target_sistemas/taskApp/model/user_entity.dart';

class UserDao {
  Future<int> saveUser({required String nome, required String senha}) async {
    final db = await AppDatabase.instance.database;
    return await db.insert('user', {'nome': nome, 'senha': senha});
  }

  Future<List<UserEntity>> getUser() async {
    final db = await AppDatabase.instance.database;
    final result = await db.query('user');
    return result.map((e) => UserEntity.fromMap(e)).toList();
  }
}
