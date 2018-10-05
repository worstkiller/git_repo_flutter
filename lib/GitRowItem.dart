import 'package:flutter/material.dart';
import 'GitRepo.dart';

class GitRowItem extends StatelessWidget {
  GitRepo repo;

  GitRowItem(GitRepo gitRepsonse) {
    this.repo = gitRepsonse;
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: new EdgeInsets.all(8.0),
        child: new Card(
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Expanded(
                child: new Container(
                  margin: new EdgeInsets.only(
                      left: 16.0, top: 8.0, bottom: 8.0, right: 8.0),
                  child: new Image.asset(
                    'assets/application.png',
                    width: 64.0,
                    height: 64.0,
                    fit: BoxFit.cover,
                  ),
                ),
                flex: 0,
              ),
              new Expanded(
                child: new Container(
                    margin: new EdgeInsets.all(8.0),
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          this.repo.getFullName(),
                          style: Theme.of(context).textTheme.title,
                        ),
                        new Text(this.repo.language,
                            textDirection: TextDirection.ltr,
                            style: Theme.of(context).textTheme.body2),
                        new Text(getParsedFuzzyDate(this.repo.updated_at),
                            textDirection: TextDirection.ltr,
                            style: Theme.of(context).textTheme.body1)
                      ],
                    )),
                flex: 2,
              ),
              new Container(
                margin: new EdgeInsets.all(8.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                      size: 20.0,
                    ),
                    new Text(
                      this.repo.stargazers_count.toString(),
                      style: Theme.of(context).textTheme.body1,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  String getParsedFuzzyDate(String dateRaw) {
    // Add a new locale messages
    var date = DateTime.parse(dateRaw);
    var now = new DateTime.now();
    var diff = now.difference(date);

    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = diff.inDays.toString();
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + ' Day ago';
      } else {
        time = diff.inDays.toString() + ' Days ago';
      }
    } else {
      if (diff.inDays == 7) {
        time = (diff.inDays / 7).floor().toString() + ' Week ago';
      } else {
        time = (diff.inDays / 7).floor().toString() + ' Weeks ago';
      }
    }

    return time;
  }
}
