part of 'models.dart';

class DetailMove extends Equatable {
  final int? id;
  final int? runtime;
  final String? tagline;
  final List<ProductionCompany>? productionCompanies;
  final List<SpokenLanguage>? spokenLanguage;


  const DetailMove({this.id, this.runtime, this.productionCompanies, this.tagline, this.spokenLanguage});

  factory DetailMove.fromJson(Map<String, dynamic> data) => DetailMove(
        id: data['id'],
        runtime: data['runtime'],
        tagline: data['tagline'],
        productionCompanies: List<ProductionCompany>.from(
            data['production_companies'].map((x) => ProductionCompany.fromJson(x))),
            spokenLanguage: List<SpokenLanguage>.from(
            data['spoken_languages'].map((x) => SpokenLanguage.fromJson(x))),
      );

  @override
  List<Object?> get props => [id, runtime, productionCompanies, tagline, spokenLanguage];
}



class ProductionCompany extends Equatable {
  final int? id;
  final String? name;
  final String? logo;

  const ProductionCompany({this.id, this.name, this.logo});

  factory ProductionCompany.fromJson(Map<String, dynamic> data) =>
      ProductionCompany(
        id: data['id'],
        name: data['name'],
        logo: data['logo_path'],
      );

  @override
  List<Object?> get props => [id, name, logo];
}

class SpokenLanguage extends Equatable{
  final String? lang;

  const SpokenLanguage({this.lang});
  factory SpokenLanguage.fromJson(Map<String, dynamic> data) => SpokenLanguage(
    lang: data['english_name'],
  );

  @override
  List<Object?> get props => [lang];
}
