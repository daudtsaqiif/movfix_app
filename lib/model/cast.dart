part of 'models.dart';

class Cast extends Equatable {
  final int? id;
  final String? name;
  final String? pict;
  final String? character;

  const Cast({this.id, this.name, this.pict, this.character});

factory Cast.fromJson(Map<String, dynamic> data) => Cast(
      id: data['id'],
      name: data['name'],
      pict: data['profile_path'],
      character: data['character'],
    );


  @override
  List<Object?> get props => [id, name, pict, character];

}
