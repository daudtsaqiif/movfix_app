part of 'upcoming_movie_cubit.dart';

sealed class UpcomingMovieState extends Equatable {
  const UpcomingMovieState();

  @override
  List<Object> get props => [];
}

final class UpcomingMovieInitial extends UpcomingMovieState {
  @override
  List<Object> get props => [];
}

final class UpcomingMovieLoaded extends UpcomingMovieState {
  final List<Movie> movies;

  const UpcomingMovieLoaded(this.movies);
  @override
  List<Object> get props => [movies];
}

final class UpcomingMovieLoadingFailed extends UpcomingMovieState{
  final String message;

  const UpcomingMovieLoadingFailed(this.message);
}
