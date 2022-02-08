import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
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
import 'package:zmovies/data/repository/api_repository.dart';
import 'package:zmovies/exception/app_exceptions.dart';

import '../../json_mock/json_mock.dart';
import '../../json_mock/mock_api_configuration.dart';
import '../../test_utils.dart';
import 'api_repository_test.mocks.dart';

@GenerateMocks([ApiDataSource])
void main() {
  late ApiRepository apiRepository;
  // must define the data source as Mock*
  late MockApiDataSource apiDataSource;
  setUp(() {
    initializeUnitTest();
    apiDataSource = MockApiDataSource();
    apiRepository = ApiRepositoryImpl(kApiKey, apiDataSource: apiDataSource);
  });
  test('getMovieGenres', () async {
    MovieGenreList mockValue = MovieGenreList.fromJson(mockMovieGenres);
    when(apiDataSource.getMovieGenres(any, any))
        .thenAnswer((_) async => mockValue);
    final result = await apiRepository.getMovieGenres();
    expect(result, mockValue);
  });
  test('getMovieLatest', () async {
    MovieLatest mockValue = MovieLatest.fromJson(mockMovieLatest);
    when(apiDataSource.getMovieLatest(any, any))
        .thenAnswer((_) async => mockValue);
    final result = await apiRepository.getMovieLatest();
    expect(result, mockValue);
  });
  test('getMovieNowPlaying', () async {
    MovieNowPlaying mockValue = MovieNowPlaying.fromJson(mockMovieNowPlaying);
    when(apiDataSource.getMovieNowPlaying(any, any, any, any))
        .thenAnswer((_) async => mockValue);
    final result = await apiRepository.getMovieNowPlaying(1);
    expect(result, mockValue);
  });
  test('getMoviePopular', () async {
    MoviePopular mockValue = MoviePopular.fromJson(mockMoviePopular);
    when(apiDataSource.getMoviePopular(any, any, any, any))
        .thenAnswer((_) async => mockValue);
    final result = await apiRepository.getMoviePopular(1);
    expect(result, mockValue);
  });
  test('getMovieTopRated', () async {
    MovieTopRated mockValue = MovieTopRated.fromJson(mockMovieTopRated);
    when(apiDataSource.getMovieTopRated(any, any, any, any))
        .thenAnswer((_) async => mockValue);
    final result = await apiRepository.getMovieTopRated(1);
    expect(result, mockValue);
  });
  test('getMovieUpcomming', () async {
    MovieUpcoming mockValue = MovieUpcoming.fromJson(mockMovieUpcoming);
    when(apiDataSource.getMovieUpcoming(any, any, any, any))
        .thenAnswer((_) async => mockValue);
    final result = await apiRepository.getMovieUpcomming(1);
    expect(result, mockValue);
  });
  test('getMovieSimilar', () async {
    MovieSimilar mockValue = MovieSimilar.fromJson(mockMovieSimilar);
    when(apiDataSource.getMovieSimilar(any, any, any, any))
        .thenAnswer((_) async => mockValue);
    final result = await apiRepository.getMovieSimilar(1, 1);
    expect(result, mockValue);
  });
  test('getMovieDetail', () async {
    MovieDetail mockValue = MovieDetail.fromJson(mockMovieDetail);
    when(apiDataSource.getMovieDetail(any, any, any, any))
        .thenAnswer((_) async => mockValue);
    final result = await apiRepository.getMovieDetail(1, null);
    expect(result, mockValue);
  });
  test('getMovieCredits', () async {
    MovieCredit mockValue = MovieCredit.fromJson(mockMovieCredits);
    when(apiDataSource.getMovieCredits(any, any, any))
        .thenAnswer((_) async => mockValue);
    final result = await apiRepository.getMovieCredits(1);
    expect(result, mockValue);
  });
  test('getMovieImages', () async {
    MovieImage mockValue = MovieImage.fromJson(mockMovieImages);
    when(apiDataSource.getMovieImages(any, any, any, any))
        .thenAnswer((_) async => mockValue);
    final result = await apiRepository.getMovieImages(1, null);
    expect(result, mockValue);
  });
  test('getMovieReviews', () async {
    MovieReview mockValue = MovieReview.fromJson(mockMovieReviews);
    when(apiDataSource.getMovieReviews(any, any, any, any))
        .thenAnswer((_) async => mockValue);
    final result = await apiRepository.getMovieReviews(1, 1);
    expect(result, mockValue);
  });
  test('getCountries', () async {
    List<ApiConfigCountry> mockValue =
        mockCountries.map((e) => ApiConfigCountry.fromJson(e)).toList();
    when(apiDataSource.getCountries(any)).thenAnswer((_) async => mockValue);
    final result = await apiRepository.getCountries();
    expect(result, mockValue);
  });
  test('getLanguages', () async {
    List<ApiConfigLanguage> mockValue =
        mockLanguages.map((e) => ApiConfigLanguage.fromJson(e)).toList();
    when(apiDataSource.getLanguages(any)).thenAnswer((_) async => mockValue);
    final result = await apiRepository.getLanguages();
    expect(result, mockValue);
  });
  test('getTimezones', () async {
    List<ApiConfigTimeZone> mockValue =
        mockTimeZones.map((e) => ApiConfigTimeZone.fromJson(e)).toList();
    when(apiDataSource.getTimezones(any)).thenAnswer((_) async => mockValue);
    final result = await apiRepository.getTimezones();
    expect(result, mockValue);
  });
  test('getApiConfig', () async {
    ApiConfig mockValue = ApiConfig.fromJson(mockApiConfig);
    when(apiDataSource.getApiConfig(any)).thenAnswer((_) async => mockValue);
    final result = await apiRepository.getApiConfig();
    expect(result, mockValue);
  });
  test('config', () async {
    String language = '';
    String region = '';
    MovieUpcoming mockValue = MovieUpcoming.fromJson(mockMovieUpcoming);
    when(apiDataSource.getMovieUpcoming(any, any, any, any))
        .thenAnswer((inv) async {
      final args = inv.positionalArguments;
      language = args[1];
      region = args[3];
      return mockValue;
    });
    apiRepository.config('JP', 'ja');
    final result = await apiRepository.getMovieUpcomming(1);
    expect(result, mockValue);
    expect(language, 'ja');
    expect(region, 'JP');
  });

  test('invalid apiKey', () async {
    final invalidApiKeyRepo = ApiRepositoryImpl('');
    expect(() => invalidApiKeyRepo.getMovieGenres(),
        throwsA(isA<ApiKeyUnsetException>()));

    expect(() => invalidApiKeyRepo.getMovieLatest(),
        throwsA(isA<ApiKeyUnsetException>()));

    expect(() async => invalidApiKeyRepo.getMovieUpcomming(1),
        throwsA(isA<ApiKeyUnsetException>()));
    expect(() async => invalidApiKeyRepo.getMoviePopular(1),
        throwsA(isA<ApiKeyUnsetException>()));

    expect(() async => invalidApiKeyRepo.getMovieTopRated(1),
        throwsA(isA<ApiKeyUnsetException>()));
    expect(() async => invalidApiKeyRepo.getMovieUpcomming(1),
        throwsA(isA<ApiKeyUnsetException>()));
    expect(() async => invalidApiKeyRepo.getMovieSimilar(1, 1),
        throwsA(isA<ApiKeyUnsetException>()));
    expect(() async => invalidApiKeyRepo.getMovieDetail(1, null),
        throwsA(isA<ApiKeyUnsetException>()));
    expect(() async => invalidApiKeyRepo.getMovieCredits(1),
        throwsA(isA<ApiKeyUnsetException>()));
    expect(() async => invalidApiKeyRepo.getMovieImages(1, null),
        throwsA(isA<ApiKeyUnsetException>()));
    expect(() async => invalidApiKeyRepo.getMovieReviews(1, 1),
        throwsA(isA<ApiKeyUnsetException>()));
    expect(() async => invalidApiKeyRepo.getCountries(),
        throwsA(isA<ApiKeyUnsetException>()));
    expect(() async => invalidApiKeyRepo.getLanguages(),
        throwsA(isA<ApiKeyUnsetException>()));
    expect(() async => invalidApiKeyRepo.getTimezones(),
        throwsA(isA<ApiKeyUnsetException>()));
    expect(() async => invalidApiKeyRepo.getApiConfig(),
        throwsA(isA<ApiKeyUnsetException>()));
  });
}
