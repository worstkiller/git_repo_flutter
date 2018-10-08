import 'dart:async';
import 'dart:convert';
import 'package:git_repo_flutter/GitRepoResponse.dart';
import 'package:http/http.dart' as http;
import 'package:git_repo_flutter/Utility.dart';

class ApiProvider {
  static final String API_ENDPOINT =
      "https://api.github.com/search/repositories";

  static Future getTrendingRepo(
      String q, String sort, String order) async {
    var uri = {"q": q, "sort": sort, "order": order};

    final response = await http.get(Utility.getUrlEncoded(API_ENDPOINT, uri));

    if (response.statusCode == 200) {
      return new GitRepoResponse.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
