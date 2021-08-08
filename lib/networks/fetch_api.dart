import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:spoonacular_api_app/api_key.dart';
import 'package:spoonacular_api_app/models/results.dart';
import 'package:spoonacular_api_app/networks/dio.dart';

List<Results> parseMovies(String responseData) {
  var l = json.decode(responseData)['results'] as List<dynamic>;
  var movies = l.map((m) => Results.fromJson(m)).toList();
  return movies;
}

Future<List<Results>> getMovies() async {
  final response = await dio().get('/top_rated',
      queryParameters: {'api_key': API_KEY, 'language': 'pt-PT'});
  if (response.statusCode == 200) {
    return compute(parseMovies, response.data.toString());
  } else {
    throw Exception('Cannot get movies');
  }
}
