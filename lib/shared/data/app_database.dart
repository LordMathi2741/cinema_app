import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
class AppDatabase{
  final int version = 1;
  final String databaseName = "movies.db";
  final String moviesTableName= "favorite_movies";
  Database? _db;

  Future<Database> openDb() async {
    _db ??= await initDatabase();
    return _db!;
  }

  Future<Database> initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, databaseName);
    return await openDatabase(
      path,
      version: version,
      onCreate: (Database db, int version) async {
         await db.execute("CREATE TABLE $moviesTableName(id INTEGER PRIMARY KEY, title TEXT, overview TEXT, image TEXT)");
      }
    );
  }

}