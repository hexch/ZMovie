import 'package:flutter/material.dart';
import 'package:zmovies/ui/model/people_model.dart';
import 'package:zmovies/ui/widget/people_view.dart';

class MovieDetailPeopleListView extends StatelessWidget {
  const MovieDetailPeopleListView({
    Key? key,
    required this.title,
    required this.peopleModels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return peopleModels.isEmpty
        ? Container()
        : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(title, style: TextStyle(fontSize: 18)),
              Container(
                height: 200,
                child: Container(
                  padding: EdgeInsets.only(left: 3),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: peopleModels.length,
                    itemBuilder: (_, index) {
                      final value = peopleModels[index];
                      return PeopleView(
                          imagePath: value.imagePath,
                          name: value.name,
                          info: value.info,
                          id: value.id,
                          onTap: (id) {});
                    },
                  ),
                ),
              ),
            ],
          );
  }

  final String title;
  final List<PeopleModel> peopleModels;
}
