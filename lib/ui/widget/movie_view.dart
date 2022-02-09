import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieView extends StatelessWidget {
  const MovieView({Key? key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? CachedNetworkImage(
            imageUrl: imageUrl!,
            imageBuilder: (context, provider) => Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Image(image: provider, fit: BoxFit.cover),
              clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
            useOldImageOnUrlChange: true,
          )
        : Container();
  }

  final String? imageUrl;
}
