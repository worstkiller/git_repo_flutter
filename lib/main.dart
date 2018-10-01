import 'package:flutter/material.dart';
import 'HomeFragment.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  String title = "Git repo";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: this.title,
        theme: new ThemeData(
          primarySwatch: Colors.red,
        ),
        home: new Scaffold(
          appBar: new AppBar(title: new Text(this.title)),
          body: new HomeFragment(),
        ));
  }
}
