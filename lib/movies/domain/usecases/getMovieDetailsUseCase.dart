import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/repository/baseMovieRepository.dart';
import '../entities/movieDetails.dart';

class GetMovieDetailsUseCase {
  BaseMoviesRepository baseMoviesRepository;


  GetMovieDetailsUseCase(this.baseMoviesRepository);

  Future<Either<Failure, MovieDetails>> call(int parameters)async{
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}