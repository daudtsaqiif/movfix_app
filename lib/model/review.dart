part of 'models.dart';

class Review extends Equatable {
  final String? author;
  final String? content;
  final String? avatar;
  final double? rating;

  const Review({this.author, this.content, this.avatar, this.rating});

  factory Review.fromJson(Map<String, dynamic> data) {
    return Review(
      author: data['author'],
      avatar: data['author_details']['avatar_path'],
      rating: data['author_details']['rating'],
      content: data['content'],
    );
  }

  @override
  List<Object?> get props => [author, content, avatar, rating];
}
