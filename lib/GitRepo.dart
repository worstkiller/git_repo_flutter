import 'RepoOwner.dart';

class GitRepo {
  int id;
  String nodeId;
  String name;
  String fullName;
  RepoOwner owner;
  String htmlUrl;
  String description;
  String cloneUrl;
  int stargazersCount;
  String language;
  int forksCount;
  String updatedAt;
  int openIssuesCount;
  num score;

  GitRepo(
      {this.id,
      this.nodeId,
      this.name,
      this.fullName,
      this.owner,
      this.htmlUrl,
      this.description,
      this.cloneUrl,
      this.stargazersCount,
      this.language,
      this.forksCount,
      this.updatedAt,
      this.openIssuesCount,
      this.score});

  factory GitRepo.fromJson(Map<String, dynamic> json) {
    return new GitRepo(
        id: json["id"],
        nodeId: json["node_id"],
        name: json["name"],
        fullName: json["full_name"],
        owner: new RepoOwner.fromJson(json["owner"]),
        htmlUrl: json["html_url"],
        description: json["description"],
        cloneUrl: json["clone_url"],
        stargazersCount: json["stargazers_count"],
        language: json["language"],
        forksCount: json["forks_count"],
        updatedAt: json["updated_at"],
        openIssuesCount: json["open_issues_count"],
        score: json["score"]);
  }
}
