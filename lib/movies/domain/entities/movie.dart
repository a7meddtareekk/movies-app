import 'package:equatable/equatable.dart';

class Movie extends Equatable{

  final int id;
  final String title;
  final String backDropPath;
  final String overView;
  final List<int> genreIds;
  final double voteAverage;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.backDropPath,
    required this.overView,
    required this.genreIds,
    required this.releaseDate,
    required this.voteAverage});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    title,
    backDropPath,
    overView,
    genreIds,
    voteAverage,
    releaseDate,

  ];







}