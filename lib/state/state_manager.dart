import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonacular_api_app/models/results.dart';
import 'package:spoonacular_api_app/networks/fetch_api.dart';

final moviesProvider = FutureProvider<List<Results>>((ref) => getMovies());

final movieProvider = FutureProvider.family((ref, id) => getMovie(id));

final movieSelected = StateProvider((ref) => Results());
