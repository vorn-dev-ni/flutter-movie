// To parse this JSON data, do
//
//     final genreModel = genreModelFromJson(jsonString);

import 'dart:convert';

GenreModel genreModelFromJson(String str) => GenreModel.fromJson(json.decode(str));

String genreModelToJson(GenreModel data) => json.encode(data.toJson());

class GenreModel {
  List<Genreresult>? genres;

  GenreModel({
    this.genres,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
    genres: json["genres"] == null ? [] : List<Genreresult>.from(json["genres"]!.map((x) => Genreresult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x.toJson())),
  };
}

class Genreresult {
  int? id;
  String? name;

  Genreresult({
    this.id,
    this.name,
  });

  factory Genreresult.fromJson(Map<String, dynamic> json) => Genreresult(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
