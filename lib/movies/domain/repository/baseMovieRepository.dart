import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/data/dataSource/MovieRemoteDataSource.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movieDetails.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepository{

  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure,List<Movie>>> getPopularMovies();
  Future<Either<Failure,List<Movie>>> getTopRatedMovies();
  Future<Either<Failure,MovieDetails>> getMovieDetails(id);
  Future<Either<Failure,List<Recommendation>>> getRecommendation(parameter);

}