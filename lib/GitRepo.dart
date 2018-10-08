import 'RepoOwner.dart';

class GitRepo {
  int id;
  String node_id;
  String name;
  String full_name;
  RepoOwner owner;
  String html_url;
  String description;
  String clone_url;
  int stargazers_count;
  String language;
  int forks_count;
  String updated_at;
  int open_issues_count;
  num score;

  GitRepo(
      {this.id,
      this.node_id,
      this.name,
      this.full_name,
      this.owner,
      this.html_url,
      this.description,
      this.clone_url,
      this.stargazers_count,
      this.language,
      this.forks_count,
      this.updated_at,
      this.open_issues_count,
      this.score});

  factory GitRepo.fromJson(Map<String, dynamic> json) {
    return new GitRepo(
        id: json["id"],
        node_id: json["node_id"],
        name: json["name"],
        full_name: json["full_name"],
        owner: new RepoOwner.fromJson(json["owner"]),
        html_url: json["html_url"],
        description: json["description"],
        clone_url: json["clone_url"],
        stargazers_count: json["stargazers_count"],
        language: json["language"],
        forks_count: json["forks_count"],
        updated_at: json["updated_at"],
        open_issues_count: json["open_issues_count"],
        score: json["score"]);
  }
}
