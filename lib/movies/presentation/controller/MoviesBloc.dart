import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/getNowPlayingUsecases.dart';
import 'package:movies_app/movies/presentation/controller/MoviesEvents.dart';
import 'package:movies_app/movies/presentation/controller/MoviesStates.dart';

import '../../domain/usecases/getPopularMoviesUsecases.dart';
import '../../domain/usecases/getTopRatedMoviesUsecases.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetNowTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async{
    final result = await getNowPlayingMoviesUseCase.execute();
    result.fold(
            (l) => emit(state.copyWith(
            nowPlayingState: RequestState.error,
            nowPlayingMessage: l.message)),
            (r) => emit(state.copyWith(
            nowPlayingMovies: r, nowPlayingState: RequestState.loaded)));
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit)async {
    final result = await getPopularMoviesUseCase.execute();

    result.fold(
            (l) => emit(state.copyWith(
            popularState: RequestState.error, popularMessage: l.message)),
            (r) => emit(state.copyWith(
            popularMovies: r, popularState: RequestState.loaded)));
  }

  FutureOr<void> _getTopRatedMovies(GetNowTopRatedMoviesEvent event, Emitter<MoviesState> emit)async {
    final result = await getTopRatedMoviesUseCase.execute();

    result.fold(
            (l) => emit(state.copyWith(
            topRatedState: RequestState.error, topRatedMessage: l.message)),
            (r) => emit(state.copyWith(
            topRatedMovies: r, topRatedState: RequestState.loaded)));
  }
}
