import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static DBHelper dbHelper = DBHelper._();
  DBHelper._();
  Database? database;

  Future<Database?> checkDB() async {
    if (database != null) {
      return await database;
    } else {
      return await creatDB();
    }
  }

  Future<Database?> creatDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "todo.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE todo (id INTEGER PRIMARY KEY AUTOINCREMENT,task TEXT,category TEXT)";
        db.execute(query);
      },
    );
  }

  void insertDB({required String task, required String category}) async {
    database = await checkDB();
    database!.insert("todo", {"task": task, "category": category});
  }

  Future<List<Map>> readDB() async {
    database = await checkDB();
    String query = "SELECT * FROM todo";

    List<Map> dataList = await database!.rawQuery(query);
    return dataList;
  }

  Future<void> Deletdata({required int id}) async {
    database = await checkDB();
    database!.delete("todo", where: "id = ?", whereArgs: [id]);
  }

  Future<void> updatedata({required int id, required String task, required String category}) async {
    database = await checkDB();
    database!.update("todo", {"task": task, "category": category});
  }

}
