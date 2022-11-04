import 'package:new_joiner/local_storage/shared_pref_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void addFavourite(String favPack) async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? data = prefs.getStringList(spk_fav) ?? [];
  data.add(favPack);
  prefs.setStringList(spk_fav, data);
}

void removeFavourite() {}

void setFavourites(List<String> favPacks) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList(spk_fav, favPacks);
}
