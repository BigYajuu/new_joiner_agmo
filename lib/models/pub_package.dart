// To parse this JSON data, do
//
//     final pubPackage = pubPackageFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PubPackage pubPackageFromJson(String str) =>
    PubPackage.fromJson(json.decode(str));

String pubPackageToJson(PubPackage data) => json.encode(data.toJson());

class PubPackage {
  PubPackage({
    required this.name,
    required this.latest,
  });

  String name;
  Latest latest;

  factory PubPackage.fromJson(Map<String, dynamic> json) => PubPackage(
        name: json["name"],
        latest: Latest.fromJson(json["latest"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "latest": latest.toJson(),
      };
}

class Latest {
  Latest({
    required this.version,
    required this.pubspec,
    required this.published,
  });

  String version;
  Pubspec pubspec;
  DateTime published;

  factory Latest.fromJson(Map<String, dynamic> json) => Latest(
        version: json["version"],
        pubspec: Pubspec.fromJson(json["pubspec"]),
        published: DateTime.parse(json["published"]),
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "pubspec": pubspec.toJson(),
        "published": published.toIso8601String(),
      };
}

class Pubspec {
  Pubspec({
    required this.name,
    required this.description,
    required this.version,
  });

  String name;
  String description;
  String version;

  factory Pubspec.fromJson(Map<String, dynamic> json) => Pubspec(
        name: json["name"],
        description: json["description"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "version": version,
      };
}
