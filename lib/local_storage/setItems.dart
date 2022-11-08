import 'package:new_joiner/local_storage/shared_pref_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future addFavourite(String favPack) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> data = prefs.getStringList(spk_fav) ?? [];
  if (!data.contains(favPack)) {
    data.add(favPack);
  }
  prefs.setStringList(spk_fav, data);
}

Future removeFavourite(String removeFav) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> data = prefs.getStringList(spk_fav) ?? [];
  data.remove(removeFav);
  prefs.setStringList(spk_fav, data);
}

Future clearFavourites() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList(spk_fav, []);
}

Future setFavourites(List<String> favPacks) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList(spk_fav, favPacks);
}
