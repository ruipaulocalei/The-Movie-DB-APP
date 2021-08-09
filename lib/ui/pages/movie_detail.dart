import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 2,
            backgroundColor: Colors.deepPurple[800],
            floating: true,
          )
        ],
      ),
    );
  }
}
