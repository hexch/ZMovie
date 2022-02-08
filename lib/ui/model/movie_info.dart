import 'package:zmovies/data/model/movie_now_playing_result.dart';
import 'package:zmovies/data/model/movie_popular_result.dart';
import 'package:zmovies/data/model/movie_similar_result.dart';
import 'package:zmovies/data/model/movie_top_rated_result.dart';
import 'package:zmovies/data/model/movie_upcoming_result.dart';

class MovieInfo {
  MovieInfo(
    this.id,
    this.title,
    this.overview,
    this.releaseDate,
    this.adult,
    this.popularity,
    this.voteCount,
    this.voteAverage,
    this.backdropUrl,
    this.posterUrl,
    this.genreIds,
  );
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final bool adult;
  final double popularity;
  final int voteCount;
  final double voteAverage;
  final String? backdropUrl;
  final String? posterUrl;
  final List<int> genreIds;
}

extension MovieNowPlayingResultMovieInfo on MovieNowPlayingResult {
  MovieInfo movieInfo(String? backdropPrefix, String? posterPrefix) =>
      MovieInfo(
        id ?? -1,
        title ?? '',
        overview ?? '',
        releaseDate ?? '',
        adult ?? false,
        popularity ?? 0,
        voteCount ?? 0,
        voteAverage ?? 0,
        backdropPrefix == null || backdropPath == null
            ? null
            : '$backdropPrefix$backdropPath',
        posterPrefix == null || posterPath == null
            ? null
            : '$posterPrefix$posterPath',
        genreIds ?? [],
      );
}

extension MoviePopularResultMovieInfo on MoviePopularResult {
  MovieInfo movieInfo(String? backdropPrefix, String? posterPrefix) =>
      MovieInfo(
        id ?? -1,
        title ?? '',
        overview ?? '',
        releaseDate ?? '',
        adult ?? false,
        popularity ?? 0,
        voteCount ?? 0,
        voteAverage ?? 0,
        backdropPrefix == null || backdropPath == null
            ? null
            : '$backdropPrefix$backdropPath',
        posterPrefix == null || posterPath == null
            ? null
            : '$posterPrefix$posterPath',
        genreIds ?? [],
      );
}

extension MovieTopRatedResultMovieInfo on MovieTopRatedResult {
  MovieInfo movieInfo(String? backdropPrefix, String? posterPrefix) =>
      MovieInfo(
        id ?? -1,
        title ?? '',
        overview ?? '',
        releaseDate ?? '',
        adult ?? false,
        popularity ?? 0,
        voteCount ?? 0,
        voteAverage ?? 0,
        backdropPrefix == null || backdropPath == null
            ? null
            : '$backdropPrefix$backdropPath',
        posterPrefix == null || posterPath == null
            ? null
            : '$posterPrefix$posterPath',
        genreIds ?? [],
      );
}

extension MovieUpcomingResultMovieInfo on MovieUpcomingResult {
  MovieInfo movieInfo(String? backdropPrefix, String? posterPrefix) =>
      MovieInfo(
        id ?? -1,
        title ?? '',
        overview ?? '',
        releaseDate ?? '',
        adult ?? false,
        popularity ?? 0,
        voteCount ?? 0,
        voteAverage ?? 0,
        backdropPrefix == null || backdropPath == null
            ? null
            : '$backdropPrefix$backdropPath',
        posterPrefix == null || posterPath == null
            ? null
            : '$posterPrefix$posterPath',
        genreIds ?? [],
      );
}

extension MovieSimilarResultMovieInfo on MovieSimilarResult {
  MovieInfo movieInfo(String? backdropPrefix, String? posterPrefix) =>
      MovieInfo(
        id ?? -1,
        title ?? '',
        overview ?? '',
        releaseDate ?? '',
        adult ?? false,
        popularity ?? 0,
        voteCount ?? 0,
        voteAverage ?? 0,
        backdropPrefix == null || backdropPath == null
            ? null
            : '$backdropPrefix$backdropPath',
        posterPrefix == null || posterPath == null
            ? null
            : '$posterPrefix$posterPath',
        genreIds ?? [],
      );
}
