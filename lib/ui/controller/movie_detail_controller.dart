import 'package:get/get.dart';
import 'package:zmovies/app_route.dart';
import 'package:zmovies/data/model/movie_credit.dart';
import 'package:zmovies/data/model/movie_detail.dart';
import 'package:zmovies/data/model/movie_genre.dart';
import 'package:zmovies/data/model/movie_image.dart';
import 'package:zmovies/data/model/movie_image_object.dart';

import 'package:zmovies/data/repository/api_repository.dart';
import 'package:zmovies/getx/app_controller.dart';
import 'package:zmovies/service/movie_service.dart';

import 'package:zmovies/ui/model/people_model.dart';
import 'package:zmovies/ui/model/movie_info.dart';

class MovieDetailController extends AppController {
  @override
  void onInit() {
    super.onInit();
    const func = 'onInit';
    logIn(func);
    final movieId = Get.arguments as int;
    _apiRepository
        .getMovieDetail(movieId, null)
        .then((value) => updateDetail(value));
    _apiRepository.getMovieCredits(movieId).then((value) => null);
    _apiRepository
        .getMovieCredits(movieId)
        .then((value) => updateCredits(value));
    _apiRepository
        .getMovieSimilar(movieId, 1)
        .then((value) => similarMovies(value.results
                ?.map((e) => e.movieInfo(
                      MovieService.me.backdropPrefix,
                      MovieService.me.posterPrefix,
                    ))
                .toList() ??
            []));
    _apiRepository
        .getMovieImages(movieId, null)
        .then((value) => updateImages(value));
    log('movieId:$movieId', func: func);
    logOut(func);
  }

  void updateDetail(MovieDetail detail) {
    const func = 'updateDetail';
    logIn(func);
    log('$detail', func: func);
    title(detail.title);
    homePage(detail.homepage);
    tagline(detail.tagline);
    overview(detail.overview);
    posterPath(detail.posterPath);
    backdropPath(detail.backdropPath);
    releaseDate(detail.releaseDate);
    runtime(detail.runtime);
    popularity(detail.popularity);
    voteAverage(detail.voteAverage);
    voteCount(detail.voteCount);
    genres(detail.genres);

    backdrop(backdropPath.isEmpty || backdropPrefix.isEmpty
        ? ''
        : '$backdropPrefix$backdropPath');
    logOut(func);
  }

  void updateCredits(MovieCredit credit) {
    const func = 'updateCredits';
    final crews = credit.crew ?? [];
    final casts = credit.cast
            ?.map((e) => e.toPeopleModel(MovieService.me.profilePrefix))
            .where((e) => e.imagePath?.isNotEmpty ?? false)
            .toList() ??
        [];
    for (var c in crews) {
      if (c.profilePath?.isEmpty ?? true) continue;
      if (movieCrewList.where((e) => e.id == c.id).isNotEmpty) continue;
      final departments = crews
          .where((e) => e.id == c.id)
          .map((e) => e.department)
          .toSet()
          .join('・');

      movieCrewList
          .add(c.toPeopleModel(MovieService.me.profilePrefix, departments));
    }
    movieCastList(casts);
    log('movieCastList:${movieCastList.length}', func: func);
    log('movieCrewList:${movieCrewList.length}', func: func);
  }

  void updateImages(MovieImage movieImage) {
    const func = 'updateImages';
    logIn(func);
    movieImages(movieImage.backdrops ?? []);
    logOut(func);
  }

  String movieImagePath(int index) {
    if (movieImages.length <= index) return '';
    if (posterPrefix.isEmpty) return '';
    final filePath = movieImages[index].filePath;
    if (filePath?.isEmpty ?? true) return '';
    return '$posterPrefix$filePath';
  }

  String get backdropPrefix => MovieService.me.backdropPrefix ?? '';
  String get posterPrefix => MovieService.me.posterPrefix ?? '';
  var backdrop = ''.obs;

  var title = ''.obs;
  var homePage = ''.obs;
  var tagline = ''.obs;
  var overview = ''.obs;
  var posterPath = ''.obs;
  var backdropPath = ''.obs;
  var releaseDate = ''.obs;
  var runtime = 0.obs;
  var popularity = 0.0.obs;
  var voteAverage = 0.0.obs;
  var voteCount = 0.obs;
  var genres = <MovieGenre>[].obs;

  var movieImages = <MovieImageObject>[].obs;
  var movieCastList = <PeopleModel>[].obs;
  var movieCrewList = <PeopleModel>[].obs;
  var similarMovies = <MovieInfo>[].obs;
  final ApiRepository _apiRepository = Get.find();
}

extension MovieDetailControllerTransition on MovieDetailController {
  String get tag => 'TRANS';
  void gotoDetail(int movieId) {
    const func = 'gotoDetail';
    logIn(func, tag);
    Get.toNamed(AppRoute.home.path + AppRoute.detail.path, arguments: movieId);
    logOut(func, tag);
  }

  void onClickMovieSimilar(int index) => gotoDetail(similarMovies[index].id);
}
