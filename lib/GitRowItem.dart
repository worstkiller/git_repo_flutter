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
                        new Text("Java",
                            textDirection: TextDirection.ltr,
                            style: Theme.of(context).textTheme.body2),
                        new Text("5 hours ago",
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
                      size: 20.0,
                    ),
                    new Text(
                      "121",
                      style: Theme.of(context).textTheme.body1,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
