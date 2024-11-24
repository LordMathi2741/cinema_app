import 'dart:io';

import '../../../../core/constant.dart';
import '../../domain/model/movieDTO.dart';
import 'package:dio/dio.dart';
class MovieService{

  Future<List<MovieDTO>> getMovies(String section, int page) async {
    try {
      final request = Dio();
      final url = "${Constant.BASE_URL}$section?api_key=${Constant.API_KEY}&language=${Constant.LANGUAGE}&page=$page";
      final response = await request.get(url);
      if (response.statusCode == HttpStatus.ok) {
        final json = response.data;
        final results = json["results"];
        return List<MovieDTO>.from(
            results.map((movie) => MovieDTO.fromJson(movie))
        );
      } else {
        throw Exception("Error while trying to fetch movies");
      }
    } catch (e) {
      throw Exception("Error while trying to fetch movies: $e");
    }
  }



}