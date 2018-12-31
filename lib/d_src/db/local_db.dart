import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;

class DbHelper {
  final int _version = 1;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  //Creating a database directory
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "habit.db");
    var theDb =
        await openDatabase(path, version: _version, onCreate: _onCreate);
    return theDb;
  }

  // Creating tables
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE habit(id TEXT PRIMARY KEY, name TEXT, descr TEXT, time TEXT,level TEXT )");
    print("habit tables");
  }

  /*// Retrieving habits from habit Table
  Future<List<habit>> habits() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM habit');
    List<habit> habits = new List();
    for (int i = 0; i < list.length; i++) {
      habits.add(new habit(list[i]["id"], list[i]["name"], list[i]["descr"],
          list[i]["time"], list[i]["level"]));
    }
    print(habits.length);
    return habits;
  }

  // Retrieving habits from habit Table
  Future<habit> habitById(String id) async {
    var dbClient = await db;
    List<Map> list =
        await dbClient.rawQuery('SELECT * FROM habit where id = "' + id + '"');
    List<habit> habits = new List();
    for (int i = 0; i < list.length; i++) {
      habits.add(new habit(list[i]["id"], list[i]["name"], list[i]["descr"],
          list[i]["time"], list[i]["level"]));
    }
    print(habits.length);
    return habits[0];
  }

  void saveHabit(habit habit) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO habit(id, name, descr, time, level) VALUES(' +
              '\'' +
              habit.id +
              '\'' +
              ',' +
              '\'' +
              habit.name +
              '\'' +
              ',' +
              '\'' +
              habit.descr +
              '\'' +
              ',' +
              '\'' +
              habit.time +
              '\'' +
              ',' +
              '\'' +
              habit.level +
              '\'' +
              ')');
    });
    print("saved habit");
  }*/
}
