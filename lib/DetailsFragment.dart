import 'package:flutter/material.dart';
import 'package:git_repo_flutter/GitRepo.dart';
import 'package:flutter/services.dart';

class DetailsFragment extends StatelessWidget {
  final GitRepo gitRepo;
  final platform = const MethodChannel("git_repo_flutter/share_intent");

  DetailsFragment({this.gitRepo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              child: Image.network(
                gitRepo.owner.avatarUrl,
                height: 80.0,
                width: 80.0,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Text(
                gitRepo.name,
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      right: 16.0,
                    ),
                    child: Icon(Icons.title),
                  ),
                  Flexible(
                      child: Text(gitRepo.language != null
                          ? "Language: ${gitRepo.language}"
                          : "Language: Unknown"))
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      right: 16.0,
                    ),
                    child: Icon(Icons.info),
                  ),
                  Flexible(child: Text("Description: ${gitRepo.description}"))
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      right: 16.0,
                    ),
                    child: Icon(Icons.favorite),
                  ),
                  Flexible(child: Text("Forks: ${gitRepo.forksCount}"))
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      right: 16.0,
                    ),
                    child: Icon(Icons.stars),
                  ),
                  Flexible(child: Text("Stars: ${gitRepo.stargazersCount}"))
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      right: 16.0,
                    ),
                    child: Icon(Icons.bug_report),
                  ),
                  Flexible(child: Text("Issues: ${gitRepo.openIssuesCount}"))
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      right: 16.0,
                    ),
                    child: Icon(Icons.calendar_today),
                  ),
                  Flexible(child: Text("Updated at: ${gitRepo.updatedAt}"))
                ],
              ),
            ),
            Divider(),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () => handleFabClick(gitRepo),
          child: Icon(
            Icons.share,
            color: Colors.white,
            size: 20.0,
          )),
    );
  }

  handleFabClick(GitRepo gitRepo) async {
    try {
      platform.invokeMethod("shareIntent", {"repo_url": gitRepo.htmlUrl});
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}
