import 'package:dio/dio.dart';

const API_ROOT = "https://pub.dev/api/";

enum SortKw {
  top("top"),
  created("created"),
  updated("updated"),
  popularity("popularity"),
  like("like"),
  points("points");

  final String getKw;
  const SortKw(this.getKw);
}

// Each API functions would return ...

// Basic calls (the 3 types)
Future<Map<String, dynamic>?> searchPubPackagesBySortByPage(
    {required String kw, required SortKw sortKw, String? nextUrl}) async {
  String url = "${API_ROOT}search?q=$kw&sort=${sortKw.getKw}&page=1";
  if (nextUrl != null) {
    url = nextUrl;
  }
  try {
    var response = await Dio().get<Map<String, dynamic>>(url);
    return response.data;
  } catch (e) {
    return null;
  }
}
