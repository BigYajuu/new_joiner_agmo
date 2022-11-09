import 'package:flutter/material.dart';

import 'package:new_joiner/api/routers/top.dart';
import 'package:new_joiner/models/package_list.dart';

class QueryPackages extends ChangeNotifier {
  // handling the query pub packages by keeping them updated
  int currPage = 1;
  String? nextUrl;
  String currKw = "";
  SortKw currSortKw = SortKw.top;
  bool isLoading = false;
  List<PackageListItem> packagePool = [];

  void _checkAndReset({String? kw, SortKw? sortKw}) {
    // if any changes in any querying keys, reset all.
    // kw and sortKw can appear individually or both at the same time.
    if (kw != null && kw != currKw) {
      currPage = 1;
      nextUrl = null;
      currKw = kw;
      packagePool = [];
    }
    if (sortKw != null && sortKw != currSortKw) {
      currPage = 1;
      nextUrl = null;
      currSortKw = sortKw;
      packagePool = [];
    }
  }

  Future<void> query({String? kw, SortKw? sortKw}) async {
    // appends parsed items
    _checkAndReset(kw: kw, sortKw: sortKw);
    isLoading = true;
    final data = await searchPubPackagesBySortByPage(
        kw: currKw, sortKw: currSortKw, nextUrl: nextUrl);
    isLoading = false;
    if (data == null) {
    } else {
      PackageList pplWhole = PackageList.fromJson(data);
      packagePool.addAll(pplWhole.packages);
      nextUrl = pplWhole.next;
    }
    notifyListeners();
  }
}
