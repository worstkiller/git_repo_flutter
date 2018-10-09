import 'GitRepo.dart';

class GitRepoResponse {
  final int total_count;
  final bool incomplete_results;
  final List<GitRepo> items;

  GitRepoResponse({this.total_count, this.incomplete_results, this.items});

  factory GitRepoResponse.fromJson(Map<String, dynamic> json) {
    return GitRepoResponse(
        total_count: json['total_count'],
        incomplete_results: json["incomplete_results"],
        items: List<GitRepo>.from(
            json['items'].map((item) => GitRepo.fromJson(item))));
  }
}
