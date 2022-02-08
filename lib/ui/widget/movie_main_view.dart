import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:zmovies/ui/model/movie_info.dart';

class MovieMainView extends StatelessWidget {
  const MovieMainView({Key? key, this.movieInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
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
    );
  }

  String? get backdrop => movieInfo?.backdropUrl;
  final MovieInfo? movieInfo;
}
