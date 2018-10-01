import 'GitRepo.dart';

class GitRepoResponse {
  int total_count;
  bool incomplete_results;
  List<GitRepo> items;

  GitRepoResponse(this.total_count, this.incomplete_results, this.items);
}
