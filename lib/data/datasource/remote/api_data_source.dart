import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
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

import 'app_dio.dart';

part 'api_data_source.g.dart';

@RestApi()
abstract class ApiDataSource {
  factory ApiDataSource({Dio? dio}) =>
      _ApiDataSource(dio ?? AppDio.getInstance());

  @GET('/genre/movie/list')
  Future<MovieGenreList> getMovieGenres(
    @Query('api_key') String apiKey,
    @Query('language') String? language,
  );

  @GET('/movie/latest')
  Future<MovieLatest> getMovieLatest(
    @Query('api_key') String apiKey,
    @Query('language') String? language,
  );

  @GET('/movie/now_playing')
  Future<MovieNowPlaying> getMovieNowPlaying(
    @Query('api_key') String apiKey,
    @Query('language') String? language,
    @Query('page') int? page,
    @Query('region') String? region,
  );
  @GET('/movie/popular')
  Future<MoviePopular> getMoviePopular(
    @Query('api_key') String apiKey,
    @Query('language') String? language,
    @Query('page') int? page,
    @Query('region') String? region,
  );

  @GET('/movie/top_rated')
  Future<MovieTopRated> getMovieTopRated(
    @Query('api_key') String apiKey,
    @Query('language') String? language,
    @Query('page') int? page,
    @Query('region') String? region,
  );

  @GET('/movie/upcoming')
  Future<MovieUpcoming> getMovieUpcoming(
    @Query('api_key') String apiKey,
    @Query('language') String? language,
    @Query('page') int? page,
    @Query('region') String? region,
  );

  @GET('/movie/{id}/similar')
  Future<MovieSimilar> getMovieSimilar(
    @Path('id') int id,
    @Query('api_key') String apiKey,
    @Query('language') String? language,
    @Query('page') int? page,
  );

  @GET('/movie/{id}')
  Future<MovieDetail> getMovieDetail(
    @Path('id') int id,
    @Query('api_key') String apiKey,
    @Query('language') String? language,
    @Query('append_to_response') String? appendToResponse,
  );

  @GET('/movie/{id}/credits')
  Future<MovieCredit> getMovieCredits(
    @Path('id') int id,
    @Query('api_key') String apiKey,
    @Query('language') String? language,
  );

  @GET('/movie/{id}/images')
  Future<MovieImage> getMovieImages(
    @Path('id') int id,
    @Query('api_key') String apiKey,
    @Query('language') String? language,
    @Query('include_image_language') String? includeImageLanguage,
  );

  @GET('/movie/{id}/reviews')
  Future<MovieReview> getMovieReviews(
    @Path('id') int id,
    @Query('api_key') String apiKey,
    @Query('language') String? language,
    @Query('page') int? page,
  );

  @GET('/configuration')
  Future<ApiConfig> getApiConfig(
    @Query('api_key') String apiKey,
  );

  @GET('/configuration/countries')
  Future<List<ApiConfigCountry>> getCountries(
    @Query('api_key') String apiKey,
  );
  @GET('/configuration/languages')
  Future<List<ApiConfigLanguage>> getLanguages(
    @Query('api_key') String apiKey,
  );

  @GET('/configuration/timezones')
  Future<List<ApiConfigTimeZone>> getTimezones(
    @Query('api_key') String apiKey,
  );
}
