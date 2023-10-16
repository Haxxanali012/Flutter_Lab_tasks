import 'package:flutter_sqlite_lab2/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Database? _database;
  String tablename = "Notes";
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await initDb();
      // ignore: recursive_getters
      return database;
    }
  }

  Future<Database> initDb() async {
    final dbpath = await getDatabasesPath();
    final note_db_path = join(dbpath, "note.db");
    return await openDatabase(note_db_path, version: 1,
        onCreate: ((db, version) {
      db.execute(
          "CREATE TABLE $tablename(id INTEGER PRIMARY KEY, title TEXT, content ) ");
    }));
  }

  insert(Note note) async {
    final db = await database;
    await db.insert(
      tablename,
      {"id": note.id, "title": note.title, "content": note.content},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  update(Note note) async {
    final db = await database;
    await db.update(tablename,
        {"id": note.id, "title": note.title, "content": note.content},
        where: "id=?", whereArgs: [note.id]);
  }

  delete(int id) async {
    final db = await database;
    await db.delete(tablename, where: "id=?", whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    final db = await database;
    return await db.query(
      tablename,
    );
  }
}
