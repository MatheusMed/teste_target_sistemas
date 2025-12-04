import 'package:teste_target_sistemas/taskApp/core/database/database_instance.dart';
import 'package:teste_target_sistemas/taskApp/model/task_entity.dart';

class TaskDao {
  Future<List<TaskEntity>> getAll() async {
    final db = await AppDatabase.instance.database;
    final result = await db.query('task');
    return result.map((e) => TaskEntity.fromMap(e)).toList();
  }

  Future<int> create(String informacao, int totalEdit) async {
    final db = await AppDatabase.instance.database;
    return await db.insert('task', {
      'informacao': informacao,
      'totalEdit': totalEdit,
    });
  }

  Future<int> update(TaskEntity task) async {
    final db = await AppDatabase.instance.database;
    return await db.update(
      'task',
      {'informacao': task.informacao, 'totalEdit': task.totalEdit},
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await AppDatabase.instance.database;
    return await db.delete('task', where: 'id = ?', whereArgs: [id]);
  }
}
