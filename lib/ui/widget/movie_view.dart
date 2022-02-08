import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieView extends StatelessWidget {
  const MovieView({Key? key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: imageUrl != null
          ? CachedNetworkImage(
              imageUrl: imageUrl!,
            )
          : Container(),
      clipBehavior: Clip.antiAliasWithSaveLayer,
    );
  }

  final String? imageUrl;
}
