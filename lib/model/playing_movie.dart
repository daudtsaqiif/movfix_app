part of 'models.dart';

class PlayingMovie extends Movie{
 const PlayingMovie({
    super.id,
    super.title,
    super.overview,
    super.image,
    super.poster,
    super.release,
    super.rating,
    super.language,
    List<int>? super.genre,
  });

  factory PlayingMovie.fromJson(Map<String, dynamic> data) => PlayingMovie(
        id: data['id'],
        title: data['title'],
        overview: data['overview'],
        image: data['backdrop_path'],
        poster: data['poster_path'],
        release: data['release_date'],
        rating: data['vote_average'],
        language: data['original_language'],
        genre: List<int>.from(data['genre_ids'].map((x) => x)),
      );

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        image,
        poster,
        release,
        rating,
        genre,
        language,
      ];
}