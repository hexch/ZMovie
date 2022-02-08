import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:zmovies/data/model/movie_genre.dart';
import 'package:zmovies/extension/app_extensions.dart';
import 'package:zmovies/data/model/api_config.dart';
import 'package:zmovies/data/model/api_config_country.dart';
import 'package:zmovies/data/model/api_config_language.dart';
import 'package:zmovies/data/model/api_config_timezone.dart';
import 'package:zmovies/data/model/movie_latest.dart';
import 'package:zmovies/data/model/movie_now_playing.dart';
import 'package:zmovies/data/model/movie_now_playing_result.dart';
import 'package:zmovies/data/model/movie_popular.dart';
import 'package:zmovies/data/model/movie_popular_result.dart';
import 'package:zmovies/data/model/movie_top_rated.dart';
import 'package:zmovies/data/model/movie_top_rated_result.dart';
import 'package:zmovies/data/model/movie_upcoming.dart';
import 'package:zmovies/data/model/movie_upcoming_result.dart';
import 'package:zmovies/data/repository/api_repository.dart';
import 'package:zmovies/getx/app_service.dart';

/// Movie Service
/// Control global config and global models ,etc.
class MovieService extends AppService {
  /// Instance of this class ,load by Get dependencies.
  static MovieService get me => Get.find();

  /// Update the configurations(region,language) of remote service.
  void config(String region, String language) =>
      _apiRepository.config(region, language);

  /// Fetch configuration from remote.
  Future fetchConfiguration() async {
    const func = 'fetchConfiguration';
    logIn(func);
    apiConfig = await _apiRepository.getApiConfig();
    log('apiConfig:$apiConfig', func: func);
    countries = await _apiRepository.getCountries();
    log('contries:$countries', func: func);
    languages = await _apiRepository.getLanguages();
    log('languages:$languages', func: func);
    timeZones = await _apiRepository.getTimezones();
    log('timeZones:$timeZones', func: func);
    logOut(func);
  }

  /// Fetch movie genres from remote.
  Future<List<MovieGenre>> fetchMovieGenres() async {
    const func = 'fetchMovieGenres';
    logIn(func);
    _movieGenreList =
        await _apiRepository.getMovieGenres().then((e) => e.genres ?? []);
    logOut(func);
    return _movieGenreList;
  }

  /// Fetch latest movie from remote.
  Future<MovieLatest?> fetchMovieLatest() async {
    const func = 'fetchMovieLatest';
    logIn(func);
    _movieLatest = await _apiRepository.getMovieLatest();
    logOut(func);
    return _movieLatest;
  }

  /// Fetch nowplaying movie from remote.
  Future<List<MovieNowPlayingResult>> fetchMovieNowPlaying() async {
    const func = 'fetchMovieNowPlaying';
    logIn(func);
    final nextPage = nextPageOfMovieNowPlaying;
    final totalPages = _movieNowPlayingList.firstOrNull?.page;
    log('nextPage:$nextPage totalPages:$totalPages', func: func);
    if (totalPages == null || nextPage < totalPages) {
      final nowPlaying = await _apiRepository.getMovieNowPlaying(nextPage);
      _movieNowPlayingList.add(nowPlaying);
      //log('$nowPlaying', func: func);
    }
    logOut(func);
    return movieNowPlayingResults;
  }

  /// Fetch popular movie from remote.
  Future<List<MoviePopularResult>> fetchMoviePopular() async {
    const func = 'fetchMoviePopular';
    logIn(func);
    final nextPage = nextPageOfMoviePopular;
    final totalPages = _moviePopularList.firstOrNull?.page;
    log('nextPage:$nextPage totalPages:$totalPages', func: func);
    if (totalPages == null || nextPage < totalPages) {
      final value = await _apiRepository.getMoviePopular(nextPage);
      _moviePopularList.add(value);
      //log('$value', func: func);
    }
    logOut(func);
    return moviePopularResults;
  }

  /// Fetch top rated movie from remote.
  Future<List<MovieTopRatedResult>> fetchMovieTopRated() async {
    const func = 'fetchMoviePopular';
    logIn(func);
    final nextPage = nextPageOfMovieTopRated;
    final totalPages = _movieTopRatedList.firstOrNull?.page;
    log('nextPage:$nextPage totalPages:$totalPages', func: func);
    if (totalPages == null || nextPage < totalPages) {
      final value = await _apiRepository.getMovieTopRated(nextPage);
      _movieTopRatedList.add(value);
      //log('$value', func: func);
    }
    logOut(func);
    return movieTopRatedResults;
  }

  /// Fetch upcomming movie from remote.
  Future<List<MovieUpcomingResult>> fetchMovieUpcoming() async {
    const func = 'fetchMoviePopular';
    logIn(func);
    final nextPage = nextPageOfMovieUpcomming;
    final totalPages = _movieUpcomingList.firstOrNull?.page;
    log('nextPage:$nextPage totalPages:$totalPages', func: func);
    if (totalPages == null || nextPage < totalPages) {
      final value = await _apiRepository.getMovieUpcomming(nextPage);
      _movieUpcomingList.add(value);
      //log('$value', func: func);
    }
    logOut(func);
    return movieUpcomingResults;
  }

  /// The prefix of the backdrop image url.
  // TODO config this in settings page
  String? get backdropPrefix => apiConfig == null
      ? null
      : '${apiConfig!.secureBaseUrl}${apiConfig!.backdropSizes.lastOrNull ?? ''}';

  /// The prefix of the poster image url.
  // TODO config this in settings page
  String? get posterPrefix => apiConfig == null
      ? null
      : '${apiConfig!.secureBaseUrl}${apiConfig!.posterSizes.lastOrNull ?? ''}';

  /// The prefix of the profile image url.
  // TODO config this in settings page
  String? get profilePrefix => apiConfig == null
      ? null
      : '${apiConfig!.secureBaseUrl}${apiConfig!.profileSizes.lastOrNull ?? ''}';

  /// [MovieLatest] getter.
  MovieLatest? get movieLatest => _movieLatest;

  /// [MovieNowPlayingResult] array getter.
  List<MovieNowPlayingResult> get movieNowPlayingResults => _movieNowPlayingList
      .map((e) => e.results ?? [])
      .expand((e) => e)
      .toList();

  /// [MoviePopularResult] array getter.
  List<MoviePopularResult> get moviePopularResults =>
      _moviePopularList.map((e) => e.results ?? []).expand((e) => e).toList();

  /// [MovieTopRatedResult] array getter.
  List<MovieTopRatedResult> get movieTopRatedResults =>
      _movieTopRatedList.map((e) => e.results ?? []).expand((e) => e).toList();

  /// [MovieUpcomingResult] array getter.
  List<MovieUpcomingResult> get movieUpcomingResults =>
      _movieUpcomingList.map((e) => e.results ?? []).expand((e) => e).toList();

  /// (Getter of)The current nowplaying movie page.
  int get nextPageOfMovieNowPlaying =>
      _movieNowPlayingList.where((e) => e.page != null).isEmpty
          ? 1
          : (_movieNowPlayingList
                      .where((e) => e.page != null)
                      .map((e) => e.page)
                      .reduce((a, b) => a! > b! ? a : b) ??
                  0) +
              1;

  /// (Getter of)The current popular movie page.
  int get nextPageOfMoviePopular =>
      _moviePopularList.where((e) => e.page != null).isEmpty
          ? 1
          : (_moviePopularList
                      .where((e) => e.page != null)
                      .map((e) => e.page)
                      .reduce((a, b) => a! > b! ? a : b) ??
                  0) +
              1;

  /// (Getter of)The current top rated movie page.
  int get nextPageOfMovieTopRated =>
      _movieTopRatedList.where((e) => e.page != null).isEmpty
          ? 1
          : (_movieTopRatedList
                      .where((e) => e.page != null)
                      .map((e) => e.page)
                      .reduce((a, b) => a! > b! ? a : b) ??
                  0) +
              1;

  /// (Getter of)The current upcoming movie page.
  int get nextPageOfMovieUpcomming =>
      _movieUpcomingList.where((e) => e.page != null).isEmpty
          ? 1
          : (_movieUpcomingList
                      .where((e) => e.page != null)
                      .map((e) => e.page)
                      .reduce((a, b) => a! > b! ? a : b) ??
                  0) +
              1;

  /// [MovieGenre] array getter.
  List<MovieGenre> get movieGenreList => _movieGenreList;

  ApiConfig? apiConfig;
  List<ApiConfigCountry> countries = [];
  List<ApiConfigLanguage> languages = [];
  List<ApiConfigTimeZone> timeZones = [];
  MovieLatest? _movieLatest;
  List<MovieGenre> _movieGenreList = [];
  final List<MovieNowPlaying> _movieNowPlayingList = [];
  final List<MoviePopular> _moviePopularList = [];
  final List<MovieTopRated> _movieTopRatedList = [];
  final List<MovieUpcoming> _movieUpcomingList = [];
  final ApiRepository _apiRepository = Get.find();
}
