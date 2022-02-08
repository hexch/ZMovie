import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zmovies/getx/app_page.dart';
import 'package:zmovies/ui/controller/movie_detail_controller.dart';
import 'package:zmovies/ui/widget/movie_detail_people_list_view.dart';
import 'package:zmovies/ui/widget/movie_horizontal_list_view.dart';

class MovieDetailPage extends AppPage<MovieDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _sliverAppBar(controller),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _movieTitle(controller),
                  const SizedBox(height: 5),
                  _infoRow(controller),
                  _extInfoRow(controller),
                  const SizedBox(height: 5),
                  _genreRow(controller),
                  const SizedBox(height: 5),
                  Obx(
                    () => Text(
                      controller.overview.isEmpty
                          ? ''
                          : controller.overview.value,
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  ..._images(controller),
                  _castList(controller),
                  _crewList(controller),
                  ..._similarMovies(controller),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sliverAppBar(MovieDetailController controller) => SliverAppBar(
        pinned: true,
        automaticallyImplyLeading: false,
        expandedHeight: 250,
        flexibleSpace: FlexibleSpaceBar(
          background: Obx(() => controller.backdrop.value.isEmpty
              ? Container()
              : Container(
                  height: 300,
                  child: CachedNetworkImage(
                    imageUrl: controller.backdrop.value,
                    fit: BoxFit.cover,
                  ),
                )),
        ),
        actions: [
          IconButton(onPressed: () => Get.back(), icon: Icon(Icons.close))
        ],
      );
  Widget _movieTitle(MovieDetailController controller) => Obx(() => Text(
        controller.title.value,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ));
  Widget _infoRow(MovieDetailController controller) => Row(
        children: [
          Obx(
            () => Text(
              controller.releaseDate.value.length < 4
                  ? '-'
                  : controller.releaseDate.substring(0, 4),
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            '・',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          Obx(
            () => Text(
              controller.runtime > 0 ? '${controller.runtime}min' : '-',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            '・',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ],
      );
  Widget _extInfoRow(MovieDetailController controller) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Icon(Icons.star_border_outlined, size: 18),
          Obx(
            () => Text(
              controller.voteAverage.toString(),
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      );
  Widget _genreRow(MovieDetailController controller) =>
      Obx(() => controller.genres.isEmpty
          ? Container()
          : Container(
              height: 32,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.genres.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(3),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Text(
                      controller.genres[index].name ?? '',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ));
  List<Widget> _images(MovieDetailController controller) => [
        Obx(
          () => controller.movieImages.isEmpty
              ? Container()
              : const SizedBox(height: 5),
        ),
        Obx(
          () => controller.movieImages.isEmpty
              ? Container()
              : Text(
                  'Images', // TODO translate
                  style: TextStyle(fontSize: 18),
                ),
        ),
        Obx(
          () => Container(
            height: controller.movieImages.isNotEmpty ? 100 : 0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.movieImages.length,
              itemBuilder: (context, index) => CachedNetworkImage(
                imageUrl: controller.movieImagePath(index),
              ),
            ),
          ),
        )
      ];

  Widget _castList(MovieDetailController controller) => Obx(
        () => controller.movieCastList.isEmpty
            ? Container()
            : MovieDetailPeopleListView(
                title: 'Cast', // TODO translate
                peopleModels: controller.movieCastList,
              ),
      );
  Widget _crewList(MovieDetailController controller) => Obx(
        () => controller.movieCrewList.isEmpty
            ? Container()
            : MovieDetailPeopleListView(
                title: 'Crew', // TODO translate
                peopleModels: controller.movieCrewList,
              ),
      );
  List<Widget> _similarMovies(MovieDetailController controller) => [
        Obx(
          () => controller.similarMovies.isEmpty
              ? Container()
              : const SizedBox(height: 5),
        ),
        Obx(
          () => controller.similarMovies.isEmpty
              ? Container()
              : Text(
                  'Similar Movies', // TODO translate
                  style: TextStyle(fontSize: 18),
                ),
        ),
        Obx(() => controller.similarMovies.isEmpty
            ? Container()
            : Container(
                height: 150,
                child: MovieHorizontalListView(
                  movies: controller.similarMovies.toList(),
                  onClick: (i) {},
                ),
              )),
      ];
}
