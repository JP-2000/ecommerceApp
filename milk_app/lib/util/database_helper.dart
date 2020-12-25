import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DatabaseHelper{
  static final DatabaseHelper instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => instance;

  static Database _db;

  final String tabeUser = "userTable";
  final String columnId = "id";
  final String columnUsername = "username";
  final String columnPassword = "password";

  Future<Database> get db async {
    if (_db != null){
      return _db ;
    }
    else {
      _db = await initDb();
      return _db;
    }
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "maindb.db");

    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE $tabeUser("
          "$columnId INTEGER PRIMARY KEY,"
          "$columnUsername TEXT,"
          "$columnPassword TEXT"
          ")"
    );
  }
}