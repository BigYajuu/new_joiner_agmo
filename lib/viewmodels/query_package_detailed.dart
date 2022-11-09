import 'package:flutter/material.dart';
import 'package:new_joiner/api/routers/top.dart';
import 'package:new_joiner/models/package_detailed.dart';

class QueryPackageDetailed extends ChangeNotifier {
  PackageDetailed? packageObj;
  String? publisherId;
  bool isLoading = false;

  Future<void> query({required String package}) async {
    isLoading = true;
    // total 2 api calls
    // 1 - packageDetails
    final data = await getPackageDetails(package: package);
    if (data == null) {
    } else {
      packageObj = PackageDetailed.fromJson(data);
    }
    // 2 - packagePublisherId
    final publisherIdData = await getPackagePublisherId(package: package);
    if (publisherIdData == null) {
    } else {
      publisherId = publisherIdData["publisherId"];
    }
    isLoading = false;
    notifyListeners();
  }
}
