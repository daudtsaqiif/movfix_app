part of 'now_playing_movie_cubit.dart';

sealed class NowPlayingMovieState extends Equatable {
  const NowPlayingMovieState();

  @override
  List<Object> get props => [];
}

final class NowPlayingMovieInitial extends NowPlayingMovieState {
  @override
  List<Object> get props => [];
}

final class NowPlayingMovieLoaded extends NowPlayingMovieState {
  final List<Movie> movies;

  const NowPlayingMovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

final class NowPlayingMovieLoadingFailed extends NowPlayingMovieState {
  final String message;

  const NowPlayingMovieLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}


