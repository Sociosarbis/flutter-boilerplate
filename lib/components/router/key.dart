import 'context.dart';

class MatchKey {
  int key;
  String name;
  MatchKey(this.name): key = routerContext.treeInfo.routeIndexer++;
  bool isSame(MatchKey other) => other.key == key;
  bool isIdentical(MatchKey other) => other.name == name;
}