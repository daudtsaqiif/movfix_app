part of 'genre_cubit.dart';

sealed class GenreState extends Equatable {
  const GenreState();

  @override
  List<Object> get props => [];
}

final class GenreInitial extends GenreState {
  @override
  List<Object> get props => [];
}

final class GenreLoaded extends GenreState {
  final List<Genre> genres;

  GenreLoaded(this.genres);

  @override
  List<Object> get props => [genres];
}

final class GenreLoadingFailed extends GenreState {
  final String massage;

  GenreLoadingFailed(this.massage);

  @override
  List<Object> get props => [massage];
}
