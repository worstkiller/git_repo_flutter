import 'package:flutter/material.dart';

import 'ApiProvider.dart';
import 'package:git_repo_flutter/GitRepoResponse.dart';
import 'package:git_repo_flutter/GitRowItem.dart';
import 'dart:async';

class HomeFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<GitRepoResponse>(
      future: ApiProvider.getTrendingRepo("android", "stars", "desc"),
      builder: (BuildContext context, AsyncSnapshot<GitRepoResponse> snapshot) {
        if (snapshot.hasData) {
          return buildGitItemList(snapshot.data);
        } else if (snapshot.hasError) {
          return new Center(
              child: new Padding(
                  padding: new EdgeInsets.all(16.0),
                  child: new Text(
                    "Sorry something went wrong, please try again after some time.",
                    textAlign: TextAlign.center,
                  )));
        } else {
          return new Center(child: new CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildGitItemList(GitRepoResponse data) {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          new GitRowItem(data.items[index]),
      itemCount: data.items.length,
    );
  }
}
