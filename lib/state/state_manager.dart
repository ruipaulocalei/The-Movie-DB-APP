import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonacular_api_app/models/movie_model.dart';
import 'package:spoonacular_api_app/networks/fetch_api.dart';

final movieProvider = FutureProvider<List<MovieModel>>((ref) => getMovies());
