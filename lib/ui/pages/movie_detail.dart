import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonacular_api_app/state/state_manager.dart';

class MovieDetailPage extends ConsumerWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final movie = watch(movieProvider(context.read(movieSelected).state.id));
    return Scaffold(
        body: movie.when(
            data: (m) => CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      elevation: 2,
                      backgroundColor: Colors.deepPurple[800],
                      floating: true,
                      expandedHeight: 300,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text('${m.title}'),
                      ),
                    )
                  ],
                ),
            loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
            error: (error, _) => Center(
                  child: Text(error.toString()),
                )));
  }
}
