import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonacular_api_app/state/state_manager.dart';
import 'package:spoonacular_api_app/ui/pages/widgets/top_rated.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.dark,
          title: Text('Movie DB'),
          floating: true,
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
