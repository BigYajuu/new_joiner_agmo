import 'package:dio/dio.dart';

const api_root = "https://pub.dev/api/";

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
  String url = "${api_root}search?q=$kw&sort=${sortKw.getKw}&page=1";
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

Future<Map<String, dynamic>?> getPackageDetails(
    {required String package}) async {
  String url = "${api_root}packages/$package";
  try {
    var response = await Dio().get<Map<String, dynamic>>(url);
    return response.data;
  } catch (e) {
    return null;
  }
}

Future<Map<String, dynamic>?> getPackagePublisherId(
    {required String package}) async {
  String url = "${api_root}packages/$package/publisher";
  try {
    var response = await Dio().get<Map<String, dynamic>>(url);
    return response.data;
  } catch (e) {
    return null;
  }
}
