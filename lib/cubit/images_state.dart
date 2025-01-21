part of 'images_cubit.dart';

sealed class ImagesState extends Equatable {
  const ImagesState();

  @override
  List<Object> get props => [];
}

final class ImagesInitial extends ImagesState {
  List<Object> get props => [];
}

final class ImagesLoaded extends ImagesState {
  final List<Images> images;

  ImagesLoaded(this.images);

  @override
  List<Object> get props => [images];
}

final class ImagesLoadingFailed extends ImagesState {
  final String massage;

  ImagesLoadingFailed(this.massage);

  @override
  List<Object> get props => [massage];
}
