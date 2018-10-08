import 'package:flutter/material.dart';

import 'ApiProvider.dart';
import 'GitRepoResponse.dart';
import 'GitRowItem.dart';
import 'dart:async';

class HomeFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<GitRepoResponse>(
      future: ApiProvider.getTrendingRepo("java", "stars", "desc"),
      builder: (BuildContext context, AsyncSnapshot<GitRepoResponse> snapshot) {
        if (snapshot.hasData) {
          return buildGitItemList(snapshot.data as GitRepoResponse);
        } else if (snapshot.error == null || snapshot.data == null) {
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

  Widget buildGitItemList(GitRepoResponse data ) {
    var listOfItems = <Widget>[];
    data.items.forEach((gitRpo) => listOfItems.add(new GitRowItem(gitRpo)));
    return new Column(children: listOfItems);
  }
}
