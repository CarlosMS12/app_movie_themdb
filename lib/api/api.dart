import 'dart:convert';

import 'package:app_movie_tbm/api/movie.dart';
import 'package:http/http.dart' as http;

class Constans {
  static const apiKey = '10da690a3e60f0ae869a59e7a98fdaef';
  static const imagePath = 'https://image.tmdb.org/t/p/w400';
}

class Api {
  static const _popularMovie =
      'https://api.themoviedb.org/3/movie/popular?api_key=${Constans.apiKey}';

  static const _nowPlayingMovie =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constans.apiKey}';

  static const _trendingMovie =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constans.apiKey}';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingMovie));

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)["results"] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Error');
    }
  }

  Future<List<Movie>> getNowPlayingMovies() async {
    final response = await http.get(Uri.parse(_nowPlayingMovie));

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)["results"] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Error');
    }
  }

  Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse(_popularMovie));

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)["results"] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Error');
    }
  }
}
