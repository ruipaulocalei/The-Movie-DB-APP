import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:spoonacular_api_app/api_key.dart';
import 'package:spoonacular_api_app/models/movie_model.dart';
import 'package:spoonacular_api_app/networks/dio.dart';

List<MovieModel> parseMovies(String responseData) {
  var l = json.decode(responseData) as List<dynamic>;
  var movies = l.map((m) => MovieModel.fromJson(m)).toList();
  return movies;
}

Future<List<MovieModel>> getMovies() async {
  final response = await dio().get('/top_rated',
      queryParameters: {'api_key': API_KEY, 'language': 'pt-PT'});
  if (response.statusCode == 200) {
    return compute(parseMovies, response.data.toString());
  } else {
    throw Exception('Cannot get movies');
  }
}
