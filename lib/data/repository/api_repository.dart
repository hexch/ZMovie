import 'package:zmovies/data/datasource/remote/api_data_source.dart';
import 'package:zmovies/data/model/api_config.dart';
import 'package:zmovies/data/model/api_config_country.dart';
import 'package:zmovies/data/model/api_config_language.dart';
import 'package:zmovies/data/model/api_config_timezone.dart';
import 'package:zmovies/data/model/movie_credit.dart';
import 'package:zmovies/data/model/movie_detail.dart';
import 'package:zmovies/data/model/movie_genre_list.dart';
import 'package:zmovies/data/model/movie_image.dart';
import 'package:zmovies/data/model/movie_latest.dart';
import 'package:zmovies/data/model/movie_now_playing.dart';
import 'package:zmovies/data/model/movie_popular.dart';
import 'package:zmovies/data/model/movie_review.dart';
import 'package:zmovies/data/model/movie_similar.dart';
import 'package:zmovies/data/model/movie_top_rated.dart';
import 'package:zmovies/data/model/movie_upcoming.dart';
import 'package:zmovies/exception/app_exceptions.dart';

/// IF of remote api service
abstract class ApiRepository {
  void config(String region, String language);

  Future<MovieGenreList> getMovieGenres();
  Future<MovieLatest> getMovieLatest();
  Future<MovieNowPlaying> getMovieNowPlaying(int page);
  Future<MoviePopular> getMoviePopular(int page);
  Future<MovieTopRated> getMovieTopRated(int page);
  Future<MovieUpcoming> getMovieUpcomming(int page);
  Future<MovieSimilar> getMovieSimilar(int id, int page);
  Future<MovieDetail> getMovieDetail(int id, String? appendToResponse);
  Future<MovieCredit> getMovieCredits(int id);
  Future<MovieImage> getMovieImages(int id, String? includeImageLanguage);
  Future<MovieReview> getMovieReviews(int id, int page);
  Future<List<ApiConfigCountry>> getCountries();
  Future<List<ApiConfigLanguage>> getLanguages();
  Future<List<ApiConfigTimeZone>> getTimezones();
  Future<ApiConfig> getApiConfig();
}

class ApiRepositoryImpl extends ApiRepository {
  ApiRepositoryImpl(this.apiKey,
      {ApiDataSource? apiDataSource, String? region, String? language})
      : _apiDataSource = apiDataSource ?? ApiDataSource() {
    _region = region ?? '';
    _language = language ?? '';
  }
  @override
  void config(String region, String language) {
    _region = region;
    _language = language;
  }

  @override
  Future<ApiConfig> getApiConfig() {
    _validApiKey();
    return _apiDataSource.getApiConfig(apiKey);
  }

  @override
  Future<List<ApiConfigTimeZone>> getTimezones() {
    _validApiKey();
    return _apiDataSource.getTimezones(apiKey);
  }

  @override
  Future<List<ApiConfigCountry>> getCountries() {
    _validApiKey();
    return _apiDataSource.getCountries(apiKey);
  }

  @override
  Future<List<ApiConfigLanguage>> getLanguages() {
    _validApiKey();
    return _apiDataSource.getLanguages(apiKey);
  }

  @override
  Future<MovieLatest> getMovieLatest() async {
    _validApiKey();
    return _apiDataSource.getMovieLatest(apiKey, _language);
  }

  @override
  Future<MovieNowPlaying> getMovieNowPlaying(int page) async {
    _validApiKey();
    return _apiDataSource.getMovieNowPlaying(apiKey, _language, page, _region);
  }

  @override
  Future<MoviePopular> getMoviePopular(int page) async {
    _validApiKey();
    return _apiDataSource.getMoviePopular(apiKey, _language, page, _region);
  }

  @override
  Future<MovieTopRated> getMovieTopRated(int page) async {
    _validApiKey();
    return _apiDataSource.getMovieTopRated(apiKey, _language, page, _region);
  }

  @override
  Future<MovieUpcoming> getMovieUpcomming(int page) async {
    _validApiKey();
    return _apiDataSource.getMovieUpcoming(apiKey, _language, page, _region);
  }

  @override
  Future<MovieSimilar> getMovieSimilar(int id, int page) async {
    _validApiKey();
    return _apiDataSource.getMovieSimilar(id, apiKey, _language, page);
  }

  @override
  Future<MovieDetail> getMovieDetail(int id, String? appendToResponse) {
    _validApiKey();
    return _apiDataSource.getMovieDetail(
        id, apiKey, _language, appendToResponse);
  }

  @override
  Future<MovieCredit> getMovieCredits(int id) {
    _validApiKey();
    return _apiDataSource.getMovieCredits(id, apiKey, _language);
  }

  @override
  Future<MovieImage> getMovieImages(int id, String? includeImageLanguage) {
    _validApiKey();
    return _apiDataSource.getMovieImages(
        id, apiKey, _language, includeImageLanguage);
  }

  @override
  Future<MovieReview> getMovieReviews(int id, int page) {
    _validApiKey();
    return _apiDataSource.getMovieReviews(id, apiKey, _language, page);
  }

  @override
  Future<MovieGenreList> getMovieGenres() async {
    _validApiKey();
    return _apiDataSource.getMovieGenres(apiKey, _language);
  }

  void _validApiKey() {
    if (apiKey.isEmpty) throw ApiKeyUnsetException();
  }

  set region(String value) => _region = value;
  set language(String value) => _language = value;
  late String _region;
  late String _language;
  final String apiKey;
  final ApiDataSource _apiDataSource;
}
