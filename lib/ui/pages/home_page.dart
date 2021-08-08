import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonacular_api_app/state/state_manager.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final movies = watch(moviesProvider);
    return Scaffold(
        body: movies.when(
      data: (movies) {
        return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (_, i) {
              return ListTile(
                title: Text('${movies[i].title}'),
              );
            });
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, _) => Center(
        child: Text(error.toString()),
      ),
    ));
  }
}
