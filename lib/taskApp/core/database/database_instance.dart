import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static final AppDatabase instance = AppDatabase._internal();

  AppDatabase._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'task.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(taskEntity);
    await db.execute(userEntity);
  }

  final taskEntity = '''
    CREATE TABLE task (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      informacao TEXT,
      totalEdit INTEGER DEFAULT 0
    );
  ''';

  final userEntity = '''
    CREATE TABLE user (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      senha TEXT
    );
  ''';
}
