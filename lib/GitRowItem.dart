import 'package:flutter/material.dart';
import 'package:git_repo_flutter/DetailsFragment.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'GitRepo.dart';

class GitRowItem extends StatelessWidget {
  final GitRepo repo;

  GitRowItem({key, @required this.repo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
        child: Card(
          child: InkWell(
            onTap: () => openDetailScreen(this.repo, context),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 16.0, top: 8.0, bottom: 8.0, right: 8.0),
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    this.repo.owner.avatarUrl))),
                      ),
                    ),
                    flex: 0,
                  ),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              this.repo.name,
                              style: Theme.of(context).textTheme.title,
                            ),
                            Text(
                                this.repo.owner.login != null
                                    ? this.repo.owner.login
                                    : "",
                                textDirection: TextDirection.ltr,
                                style: Theme.of(context).textTheme.body2),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      getParsedFuzzyDate(this.repo.updatedAt),
                                      textDirection: TextDirection.ltr,
                                      style: Theme.of(context).textTheme.body1),
                                  flex: 3,
                                ),
                                Expanded(
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.redAccent,
                                    size: 20.0,
                                  ),
                                  flex: 0,
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 4.0),
                                    child: Text(
                                      this.repo.stargazersCount.toString(),
                                      style: Theme.of(context).textTheme.body1,
                                    ),
                                  ),
                                  flex: 1,
                                )
                              ],
                            )
                          ],
                        )),
                    flex: 2,
                  ),
                ]),
          ),
        ));
  }

  String getParsedFuzzyDate(String dateRaw) {
    // Add a new locale messages
    var date = DateTime.parse(dateRaw);
    return timeago.format(date);
  }

  openDetailScreen(GitRepo repo, BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsFragment(
                  gitRepo: repo,
                )));
  }
}
