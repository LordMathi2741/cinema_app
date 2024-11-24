import 'package:cinema/shared/data/app_database.dart';
import 'package:cinema/shared/data/base_repository.dart';

import '../../domain/model/movieDTO.dart';

class MovieRepository extends BaseRepository<MovieDTO>{
  final AppDatabase databaseHelper = AppDatabase();
  @override
  Future<int> delete(int id) async {
    final db =  await databaseHelper.openDb();
    int movieId = await db.delete(databaseHelper.moviesTableName, where: "id = ?", whereArgs: [id]);
    return movieId;
  }

  @override
  Future<List<MovieDTO>?> getAll() async{
    final db =  await databaseHelper.openDb();
    final movies = await db.query(databaseHelper.moviesTableName);
    return movies.isNotEmpty ? movies.map((movie) => MovieDTO.fromMap(movie)).toList() : null;
  }

  @override
  Future<MovieDTO?> getById(int id) async {
    final db =  await databaseHelper.openDb();
    final movie = await db.query(databaseHelper.moviesTableName, where: "id = ?", whereArgs: [id]);
    return movie.isNotEmpty ?  MovieDTO.fromMap(movie.first) : null;
  }

  @override
  Future<int> insert(MovieDTO dataToInsert) async{
    final db =  await databaseHelper.openDb();
    final movieId = db.insert(databaseHelper.moviesTableName, dataToInsert.toMap() );
    return movieId;
  }

  @override
  Future<int> update(int id, MovieDTO newElement)async {
    final db =  await databaseHelper.openDb();
    final movieId = db.update(databaseHelper.moviesTableName, newElement.toMap(),  where: "id = ?", whereArgs: [id]);
    return movieId;
  }

  Future<bool> isAlreadyInFavorites(String title) async{
    final db =  await databaseHelper.openDb();
    final result =  await db.query(databaseHelper.moviesTableName, where: "title = ?", whereArgs: [title]);
    return result.isNotEmpty;
  }

  Future<MovieDTO?> getMovieByTitle(String title) async {
    final db = await databaseHelper.openDb();
    final result = await db.query(
      databaseHelper.moviesTableName,
      where: "title = ?",
      whereArgs: [title],
    );
    if (result.isNotEmpty) {
      return MovieDTO.fromMap(result.first);
    }
    return null;
  }



}