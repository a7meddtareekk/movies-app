import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repository/baseMovieRepository.dart';

class GetRecommendationUseCase  {

  BaseMoviesRepository baseMoviesRepository;


  GetRecommendationUseCase(this.baseMoviesRepository);

  Future<Either<Failure, List<Recommendation>>> call( parameters)async{
    return await baseMoviesRepository.getRecommendation(parameters);
  }
}

