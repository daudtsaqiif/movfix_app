part of 'models.dart';

class Video extends Equatable {
  final int? id;
  final String? key;
  final String? name;

  const Video({this.id, this.key, this.name});

  factory Video.fromJson(Map<String, dynamic> data) => Video(
        id: data['id'],
        key: data['key'],
        name: data['name'],
      );

  @override
  List<Object?> get props => [id, key, name];
}
