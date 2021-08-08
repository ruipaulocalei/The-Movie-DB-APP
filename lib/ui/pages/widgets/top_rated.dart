import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonacular_api_app/state/state_manager.dart';

class TopRated extends ConsumerWidget {
  const TopRated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final movies = watch(moviesProvider);
    final size = MediaQuery.of(context).size;
    return movies.when(
      data: (movies) {
        return Container(
          height: size.height * 0.30,
          color: Colors.grey,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: movies.length,
              itemBuilder: (_, i) {
                return Card(
                  elevation: 8,
                  child: Container(
                    height: double.infinity,
                    width: size.width * 0.3,
                    child: Text(
                      '${movies[i].releaseDate}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              }),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, _) => Center(
        child: Text(error.toString()),
      ),
    );
  }
}
