import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/baseMovieRepository.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCase{
final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);
  Future<Either<Failure,List<Movie>>> execute()async{
    return await baseMoviesRepository.getNowPlayingMovies();
  }

}