import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
      required super.id,
      required super.title,
      required super.backDropPath,
      required super.overView,
      required super.genreIds,
      required super.releaseDate,
      required super.voteAverage});

factory MovieModel.fromJson(Map<String,dynamic>json)=>MovieModel(
    id: json['id'],
    title: json['title'],
    backDropPath: json['backdrop_path'],
    overView: json['overview'],
    genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
    releaseDate: json['release_date'],
    voteAverage: json['vote_average']);
}
