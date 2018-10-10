import 'GitRepo.dart';

class GitRepoResponse {
  final int totalCount;
  final bool incompleteResults;
  final List<GitRepo> items;

  GitRepoResponse({this.totalCount, this.incompleteResults, this.items});

  factory GitRepoResponse.fromJson(Map<String, dynamic> json) {
    return GitRepoResponse(
        totalCount: json['total_count'],
        incompleteResults: json["incomplete_results"],
        items: List<GitRepo>.from(
            json['items'].map((item) => GitRepo.fromJson(item))));
  }
}
