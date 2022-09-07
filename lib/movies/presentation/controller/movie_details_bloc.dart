import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movieDetails.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecases/getMovieDetailsUseCase.dart';
import 'package:movies_app/movies/domain/usecases/getRecommendationUseCase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase,this.getRecommendationUseCase) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }
final GetMovieDetailsUseCase getMovieDetailsUseCase;
final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit)async {
   final result =  await getMovieDetailsUseCase(event.id);
   result.fold((l) => emit(state.copyWith(movieDetailsState: RequestState.error,movieDetailsMessage: l.message)),
           (r) => emit(state.copyWith(movieDetails:r, movieDetailsState: RequestState.loaded)));
  }

  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit)async {

    final result =  await getRecommendationUseCase(event.id);
    result.fold((l) => emit(state.copyWith(recommendationState: RequestState.error,recommendationMessage: l.message)),
            (r) => emit(state.copyWith(recommendation:r, recommendationState: RequestState.loaded)));
  }
}
