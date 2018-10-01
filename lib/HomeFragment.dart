import 'package:flutter/material.dart';
import 'GitRepo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'GitRowItem.dart';

class HomeFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GitRowItem(getRepoModel());
  }

  GitRepo getRepoModel() {
    return new GitRepo(null, null, null, "flutter singh", null, null, null,
        null, null, null, null, null, null, null);
  }
}
