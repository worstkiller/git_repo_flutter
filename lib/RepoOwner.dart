class RepoOwner {
  String login, avatar_url;

  RepoOwner({this.login, this.avatar_url});

  factory RepoOwner.fromJson(Map<String, dynamic> json) {
    return new RepoOwner(login: json["login"], avatar_url: json["avatar_url"]);
  }
}
