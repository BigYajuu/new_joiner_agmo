import 'package:new_joiner/local_storage/shared_pref_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<String>> getFavourites() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList(spk_fav) ?? []; // gets JSON
}
