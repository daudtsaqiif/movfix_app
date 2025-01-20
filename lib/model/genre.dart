part of 'models.dart';

class Genre extends Equatable {
  final int? id;
  final String? name;

  const Genre({this.id, this.name});

  factory Genre.fromJson(Map<String, dynamic> data) => Genre(
        id: data['id'],
        name: data['name'],
      );

  @override
  List<Object?> get props => [id, name];
}
