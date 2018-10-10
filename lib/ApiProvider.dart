import 'dart:async';
import 'dart:convert';
import 'package:git_repo_flutter/GitRepoResponse.dart';
import 'package:http/http.dart' as http;
import 'package:git_repo_flutter/Utility.dart';

class ApiProvider {
  static const String API_ENDPOINT =
      "https://api.github.com/search/repositories";

  static Future<GitRepoResponse> getTrendingRepo(
      String q, String sort, String order) async {
    var uri = {"q": q, "sort": sort, "order": order};

    final response = await http.get(Utility.getUrlEncoded(API_ENDPOINT, uri));
    print(Utility.getUrlEncoded(API_ENDPOINT, uri));

    if (response.statusCode == 200) {
      return GitRepoResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Some error occurred while getting data from server");
    }
  }
}
