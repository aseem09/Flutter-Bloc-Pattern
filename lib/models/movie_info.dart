// To parse this JSON data, do
//
//     final movieInfoResponse = movieInfoResponseFromJson(jsonString);

import 'dart:convert';

MovieInfoResponse movieInfoResponseFromJson(String str) => MovieInfoResponse.fromJson(json.decode(str));

String movieInfoResponseToJson(MovieInfoResponse data) => json.encode(data.toJson());

class MovieInfoResponse {
  int id;
  List<MovieInfo> results;

  MovieInfoResponse({
    this.id,
    this.results,
  });

  factory MovieInfoResponse.fromJson(Map<String, dynamic> json) => MovieInfoResponse(
    id: json["id"],
    results: List<MovieInfo>.from(json["results"].map((x) => MovieInfo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class MovieInfo {
  String id;
  String iso6391;
  String iso31661;
  String key;
  String name;
  String site;
  int size;
  String type;

  MovieInfo({
    this.id,
    this.iso6391,
    this.iso31661,
    this.key,
    this.name,
    this.site,
    this.size,
    this.type,
  });

  factory MovieInfo.fromJson(Map<String, dynamic> json) => MovieInfo(
    id: json["id"],
    iso6391: json["iso_639_1"],
    iso31661: json["iso_3166_1"],
    key: json["key"],
    name: json["name"],
    site: json["site"],
    size: json["size"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "iso_639_1": iso6391,
    "iso_3166_1": iso31661,
    "key": key,
    "name": name,
    "site": site,
    "size": size,
    "type": type,
  };
}
