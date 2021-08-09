import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonacular_api_app/state/state_manager.dart';
import 'package:animate_do/animate_do.dart';

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
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification.metrics.extentBefore ==
                    scrollNotification.metrics.maxScrollExtent) {
                  return true;
                }
                return false;
              },
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: movies.length,
                  itemBuilder: (_, i) {
                    return FadeInUp(
                      delay: Duration(milliseconds: 400),
                      child: GestureDetector(
                        onTap: () {
                          log('Id do filme ${movies[i].id}');
                        },
                        child: Card(
                          elevation: 8,
                          child: Container(
                              height: double.infinity,
                              width: size.width * 0.3,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: CachedNetworkImage(
                                      imageUrl: movies[i].posterPath != null
                                          ? 'https://image.tmdb.org/t/p/w500/${movies[i].posterPath}'
                                          : 'https://st4.depositphotos.com/14953852/22772/v/600/depositphotos_227725020-stock-illustration-image-available-icon-flat-vector.jpg',
                                      height: double.infinity,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Positioned(
                                      bottom: 20,
                                      child: Text(
                                        '${movies[i].title}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                    );
                  }),
            ));
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
