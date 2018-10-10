class RepoOwner {
  final String login;
  final String avatarUrl;

  RepoOwner({this.login, this.avatarUrl});

  factory RepoOwner.fromJson(Map<String, dynamic> json) {
    return new RepoOwner(login: json["login"], avatarUrl: json["avatar_url"]);
  }
}
