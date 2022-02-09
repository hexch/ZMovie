import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zmovies/getx/app_page.dart';
import 'package:zmovies/ui/controller/home_controller.dart';
import 'package:zmovies/ui/widget/movie_horizontal_list_view.dart';
import 'package:zmovies/ui/widget/movie_main_view.dart';

class HomePage extends AppPage<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() => MovieMainView(
                movieInfo: controller.movieMain.value,
                genres: controller.movieMainGenres,
              )),
          _title('movie_now_playing_title'.tr),
          Obx(() => MovieHorizontalListView(
                movies: controller.movieNowPlayingList.toList(),
                onClick: (i) => controller.onClickMovieNowPlaying(i),
              )),
          _title('movie_upcoming_title'.tr),
          Obx(() => MovieHorizontalListView(
                movies: controller.movieUpcomingList.toList(),
                onClick: (i) => controller.onClickMovieUpcoming(i),
              )),
          _title('movie_top_rated_title'.tr),
          Obx(() => MovieHorizontalListView(
                movies: controller.movieTopRatedList.toList(),
                onClick: (i) => controller.onClickMovieTopRated(i),
              )),
          _title('movie_popular_title'.tr),
          Obx(() => MovieHorizontalListView(
                movies: controller.moviePopularList.toList(),
                onClick: (i) => controller.onClickMoviePopular(i),
              )),
        ],
      ),
    ));
  }

  Widget _title(String text) => Container(
        padding: EdgeInsets.only(left: 6, top: 5),
        child: Text(text, style: TextStyle(fontSize: 18)),
      );
}
