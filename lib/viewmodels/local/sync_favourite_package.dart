import 'package:flutter/material.dart';
import 'package:new_joiner/local_storage/getItems.dart';
import 'package:new_joiner/local_storage/setItems.dart';

class SyncFavPackages extends ChangeNotifier {
  // the list of favourite packages here
  // aims to be in sync with the local storage
  List<String> favPacks = [];
  bool isLoading = false;

  SyncFavPackages() {
    refresh();
  }

  Future refresh() async {
    isLoading = true;
    favPacks = await getFavourites();
    isLoading = false;
    notifyListeners();
  }
}
