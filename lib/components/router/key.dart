import './context.dart';

class UniqKey {
  int key;
  String name;
  UniqKey(this.name): key = routerContext.treeInfo.routeIndexer++;
}