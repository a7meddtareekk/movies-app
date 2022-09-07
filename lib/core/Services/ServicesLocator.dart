import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/dataSource/MovieRemoteDataSource.dart';
import 'package:movies_app/movies/data/repository/moviesRepository.dart';
import 'package:movies_app/movies/domain/repository/baseMovieRepository.dart';
import 'package:movies_app/movies/domain/usecases/getMovieDetailsUseCase.dart';
import 'package:movies_app/movies/domain/usecases/getNowPlayingUsecases.dart';
import 'package:movies_app/movies/domain/usecases/getPopularMoviesUsecases.dart';
import 'package:movies_app/movies/domain/usecases/getRecommendationUseCase.dart';
import 'package:movies_app/movies/domain/usecases/getTopRatedMoviesUsecases.dart';
import 'package:movies_app/movies/presentation/controller/MoviesBloc.dart';
import 'package:movies_app/movies/presentation/controller/movie_details_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));


    ///UseCases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));


    /// Data Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));


    ///Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
