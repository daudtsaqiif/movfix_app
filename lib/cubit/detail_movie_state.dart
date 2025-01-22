part of 'detail_movie_cubit.dart';

sealed class DetailMovieState extends Equatable {
  const DetailMovieState();

  @override
  List<Object> get props => [];
}

final class DetailMovieInitial extends DetailMovieState {
  @override
  List<Object> get props => [];
}

final class DetailMovieLoaded extends DetailMovieState {
  final DetailMove detail;

  const DetailMovieLoaded(this.detail);

  @override
  List<Object> get props => [detail];
}

final class DetailMovieLoadingFailed extends DetailMovieState {
  final String massage;

 const DetailMovieLoadingFailed(this.massage);

  @override
  List<Object> get props => [massage];
}
