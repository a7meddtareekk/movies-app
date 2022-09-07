import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/genres.dart';

class MovieDetails extends Equatable {
  final String backDropPath;
  final List<Genres>genres;
  final String overView;
  final String releaseData;
  final String title;
  final double voteAverage;
  final int id;
  final int runtime;

  const MovieDetails({
    required this.backDropPath,
    required this.genres,
    required this.overView,
    required this.releaseData,
    required this.title,
    required this.voteAverage,
    required this.id,
    required this.runtime});

  @override
  // TODO: implement props
  List<Object?> get props => [
    backDropPath,
    genres,
    overView,
    releaseData,
    title,
    voteAverage,
    id,
    runtime,
  ];
}
