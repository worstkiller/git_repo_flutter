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
      this.id,
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
      this.score);

  int getId() {
    return id;
  }

  String getName() {
    return name;
  }

  String getFullName() {
    return full_name;
  }

  RepoOwner getOwner() {
    return owner;
  }

  String getHtmlUrl() {
    return html_url;
  }

  String getDescription() {
    return description;
  }

  String getCloneUrl() {
    return clone_url;
  }

  int getStargazersCount() {
    return stargazers_count;
  }

  String getLanguage() {
    return language;
  }

  int getForksCount() {
    return forks_count;
  }

  String getUpdatedAt() {
    return updated_at;
  }

  int getOpenIssues() {
    return open_issues_count;
  }

  num getScore() {
    return score;
  }
}
