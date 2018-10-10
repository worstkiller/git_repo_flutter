import 'package:flutter/material.dart';
import 'package:git_repo_flutter/GitRepoResponse.dart';
import 'package:git_repo_flutter/GitRowItem.dart';

import 'ApiProvider.dart';

class HomeFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GitRepoResponse>(
      future: ApiProvider.getTrendingRepo("android", "stars", "desc"),
      builder: (BuildContext context, AsyncSnapshot<GitRepoResponse> snapshot) {
        if (snapshot.hasData) {
          return buildGitItemList(snapshot.data);
        } else if (snapshot.hasError) {
          return Center(
              child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Sorry something went wrong, please try again after some time.",
                    textAlign: TextAlign.center,
                  )));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildGitItemList(GitRepoResponse data) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => GitRowItem(
            repo: data.items[index],
          ),
      itemCount: data.items.length,
    );
  }
}
