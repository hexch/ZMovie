import 'package:flutter/material.dart';
import 'package:zmovies/ui/model/movie_info.dart';

import 'movie_view.dart';

class MovieHorizontalListView extends StatelessWidget {
  const MovieHorizontalListView({
    Key? key,
    required this.movies,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 3),
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: movies.length,
        itemBuilder: (_, index) {
          return Container(
            padding: EdgeInsets.all(3),
            child: InkWell(
              onTap: () => onClick.call(index),
              child: MovieView(
                imageUrl: movies[index].posterUrl,
              ),
            ),
          );
        },
      ),
    );
  }

  final List<MovieInfo> movies;
  final Function(int) onClick;
}
