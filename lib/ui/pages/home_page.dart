import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonacular_api_app/ui/pages/widgets/top_rated.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.purple,
          brightness: Brightness.dark,
          title: Text(
            'Movie DB',
            style: TextStyle(color: Colors.white),
          ),
          floating: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 8),
          sliver: SliverToBoxAdapter(
            child: TopRated(),
          ),
        ),
      ],
    ));
  }
}
