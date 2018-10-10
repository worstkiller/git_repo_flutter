import 'package:flutter/material.dart';
import 'package:git_repo_flutter/GitRepo.dart';

class DetailsFragment extends StatelessWidget {
  GitRepo gitRepo;

  DetailsFragment(this.gitRepo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Center(
        child: Text(gitRepo.name),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Icon(
            Icons.share,
            color: Colors.white,
            size: 20.0,
          )),
    );
  }
}
