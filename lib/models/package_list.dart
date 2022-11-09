// To parse this JSON data, do
//
//     final pubPackageList = pubPackageListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PackageList pubPackageListFromJson(String str) =>
    PackageList.fromJson(json.decode(str));

String pubPackageListToJson(PackageList data) => json.encode(data.toJson());

class PackageList {
  PackageList({
    required this.packages,
    required this.next,
  });

  List<PackageListItem> packages;
  String next;

  factory PackageList.fromJson(Map<String, dynamic> json) => PackageList(
        packages: List<PackageListItem>.from(
            json["packages"].map((x) => PackageListItem.fromJson(x))),
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "packages": List<dynamic>.from(packages.map((x) => x.toJson())),
        "next": next,
      };
}

class PackageListItem {
  PackageListItem({
    required this.package,
  });

  String package;

  factory PackageListItem.fromJson(Map<String, dynamic> json) =>
      PackageListItem(
        package: json["package"],
      );

  Map<String, dynamic> toJson() => {
        "package": package,
      };
}
