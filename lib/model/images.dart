part of 'models.dart';

class Images extends Equatable {
  final int? id;
  final String? images;

  const Images({this.id, this.images});

  factory Images.fromJson(Map<String, dynamic> data) => Images(
        id: data['id'],
        images: data['file_path'],
      );

  @override
  List<Object?> get props => [id, images];
}
