import 'package:get/get.dart';
import 'package:zmovies/app_route.dart';
import 'package:zmovies/getx/app_controller.dart';
import 'package:zmovies/service/movie_service.dart';
import 'package:zmovies/ui/model/movie_info.dart';

class HomeController extends AppController {
  @override
  void onInit() {
    super.onInit();
    const func = 'onInit';
    logIn(func);
    // MovieService.me
    //     .fetchMovieLatest()
    //     .then((value) => movieLatestList(value == null ? [] : [value]));
    final backdropPrefix = MovieService.me.backdropPrefix;
    final posterPrefix = MovieService.me.posterPrefix;
    MovieService.me
        .fetchMovieNowPlaying()
        .then((value) => value
            .map((e) => e.movieInfo(backdropPrefix, posterPrefix))
            .toList())
        .then((value) {
      if (value.isEmpty) return;
      movieMain(value[0]);
      final genres = MovieService.me.movieGenreList
          .where((e) => value[0].genreIds.contains(e.id))
          .map((e) => e.name)
          .where((e) => e != null)
          .map((e) => e!)
          .toList();
      movieMainGenres(genres);
      if (value.length < 2) return;
      movieNowPlayingList(value.sublist(1));
    });
    MovieService.me
        .fetchMoviePopular()
        .then((value) => value
            .map((e) => e.movieInfo(backdropPrefix, posterPrefix))
            .toList())
        .then((value) => moviePopularList(value));
    MovieService.me
        .fetchMovieTopRated()
        .then((value) => value
            .map((e) => e.movieInfo(backdropPrefix, posterPrefix))
            .toList())
        .then((value) => movieTopRatedList(value));
    MovieService.me
        .fetchMovieUpcoming()
        .then((value) => value
            .map((e) => e.movieInfo(backdropPrefix, posterPrefix))
            .toList())
        .then((value) => movieUpcomingList(value));
    logOut(func);
  }

  var movieMain = Rx<MovieInfo?>(null);
  final movieMainGenres = <String>[].obs;
  // latest movie sometimes not show,and changed continuously
  //final movieLatestList = <MovieLatest>[].obs;
  final movieNowPlayingList = <MovieInfo>[].obs;
  final moviePopularList = <MovieInfo>[].obs;
  final movieTopRatedList = <MovieInfo>[].obs;
  final movieUpcomingList = <MovieInfo>[].obs;
}

extension HomeControllerTransition on HomeController {
  String get tag => 'TRANS';
  void gotoDetail(int movieId) {
    const func = 'gotoDetail';
    logIn(func, tag);
    Get.toNamed(AppRoute.home.path + AppRoute.detail.path, arguments: movieId);
    logOut(func, tag);
  }

  void onClickMovieNowPlaying(int index) =>
      gotoDetail(movieNowPlayingList[index].id);
  void onClickMoviePopular(int index) => gotoDetail(moviePopularList[index].id);
  void onClickMovieTopRated(int index) =>
      gotoDetail(movieTopRatedList[index].id);
  void onClickMovieUpcoming(int index) =>
      gotoDetail(movieUpcomingList[index].id);
}
