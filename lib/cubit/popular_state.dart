part of 'popular_cubit.dart';

sealed class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object> get props => [];
}

final class PopularInitial extends PopularState {
  @override
  List<Object> get props => [];
}

final class PopularLoaded extends PopularState {
  final List<Movie> populars;

  PopularLoaded(this.populars);

  @override
  List<Object> get props => [populars];
}

final class PopularLoadingFailed extends PopularState {
  final String massage;

  PopularLoadingFailed(this.massage);

  @override
  List<Object> get props => [massage];
}
