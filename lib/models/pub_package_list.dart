// To parse this JSON data, do
//
//     final pubPackageList = pubPackageListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PubPackageList pubPackageListFromJson(String str) =>
    PubPackageList.fromJson(json.decode(str));

String pubPackageListToJson(PubPackageList data) => json.encode(data.toJson());

class PubPackageList {
  PubPackageList({
    required this.packages,
    required this.next,
  });

  List<Package> packages;
  String next;

  factory PubPackageList.fromJson(Map<String, dynamic> json) => PubPackageList(
        packages: List<Package>.from(
            json["packages"].map((x) => Package.fromJson(x))),
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "packages": List<dynamic>.from(packages.map((x) => x.toJson())),
        "next": next,
      };
}

class Package {
  Package({
    required this.package,
  });

  String package;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        package: json["package"],
      );

  Map<String, dynamic> toJson() => {
        "package": package,
      };
}
