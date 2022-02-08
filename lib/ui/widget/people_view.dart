import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PeopleView extends StatelessWidget {
  const PeopleView({
    Key? key,
    this.imagePath,
    required this.name,
    required this.info,
    required this.id,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      child: Column(
        children: [
          Container(
            height: 150,
            child: InkWell(
              onTap: () => onTap.call(id),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                child: imagePath != null
                    ? CachedNetworkImage(imageUrl: imagePath!)
                    : Container(),
                clipBehavior: Clip.antiAliasWithSaveLayer,
              ),
            ),
          ),
          Text(name, style: TextStyle(fontSize: 10)),
          Text(info, style: TextStyle(fontSize: 8)),
        ],
      ),
    );
  }

  final String? imagePath;
  final String name;
  final String info;
  final int id;
  final Function(int) onTap;
}
