import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:zmovies/ui/model/movie_info.dart';

class MovieMainView extends StatelessWidget {
  MovieMainView({Key? key, this.movieInfo, List<String>? genres})
      : genres = genres ?? [],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.transparent],
          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        blendMode: BlendMode.dstIn,
        child: Container(
          height: 300,
          child: backdrop != null
              ? CachedNetworkImage(
                  imageUrl: backdrop!,
                  fit: BoxFit.cover,
                )
              : Container(),
        ),
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(genresText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
          // ElevatedButton.icon(
          //   onPressed: () {},
          //   icon: Icon(Icons.info_outline_rounded),
          //   label: Text('INFO'),
          // ),
          const SizedBox(height: 20),
        ],
      )
    ]);
  }

  String get genresText => genres.join('・');
  String? get backdrop => movieInfo?.backdropUrl;
  final MovieInfo? movieInfo;
  final List<String> genres;
}
