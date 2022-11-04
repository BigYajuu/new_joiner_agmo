import 'package:flutter/material.dart';
import 'package:new_joiner/local_storage/getItems.dart';
import 'package:new_joiner/local_storage/setItems.dart';

class SyncPackages extends ChangeNotifier {
  // the list of favourite packages here
  // aims to be in sync with the local storage
  List<String> favPacks = [];

  void _updateLocal() {
    setFavourites(favPacks);
  }

  void _retrieveLocal() async {
    favPacks = await getFavourites();
  }

  void add(String newFav) async {}
}
