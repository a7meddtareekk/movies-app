import 'package:movies_app/movies/data/models/genresModel.dart';
import 'package:movies_app/movies/domain/entities/movieDetails.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.backDropPath,
      required super.genres,
      required super.overView,
      required super.releaseData,
      required super.title,
      required super.voteAverage,
      required super.id,
      required super.runtime});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
          backDropPath: json['backdrop_path'],
          genres: List<GenresModel>.from(json['genres'].map((x) => GenresModel.fromJson(x))),
          overView: json['overview'],
          releaseData: json['release_date'],
          title: json['title'],
          voteAverage: json['vote_average'].toDouble(),
          id: json['id'],
          runtime: json['runtime']);
}
