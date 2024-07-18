import 'dart:convert';

import 'package:app_movie_tbm/api/movie.dart';
import 'package:http/http.dart' as http;

class Constans {
  static const apiKey = '10da690a3e60f0ae869a59e7a98fdaef';
  static const imagePath = 'https://image.tmdb.org/t/p/w500';
}

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=${Constans.apiKey}';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)["results"] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Error');
    }
  }
}
