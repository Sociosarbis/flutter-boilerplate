import './params.dart';
import './key.dart';

class AppHistory {
  final _history = <AppHistoryEntry>[];
  bool allowDuplications = false;
  AppHistoryEntry get current => _history.last;
  AppHistoryEntry get last => _history[_history.length - 2];
  

  bool get hasLast => _history.length > 1;
  bool get isEmpty => _history.isEmpty;
  int get length => _history.length;

  void add(AppHistoryEntry entry) {
    if (hasLast && !allowDuplications) {
      if (current.isSame(entry)) {
        removeLast();
      }
      if (hasLast && last.isSame(entry)) {
        _history.removeAt(_history.length - 2);
      }
    }
    _history.add(entry);
  }
  void removeLast({ int count = 1 }) {
    for (int i = 0;i < count;i++) {
      if (_history.isNotEmpty) {
        _history.removeLast();
      } else break;
    }
  }

  void removeWithNavigator(String navi) {
    _history.removeWhere((element) => element.navigator == navi);
  }
}


class AppHistoryEntry {
  final UniqKey key;
  final String path;
  final String navigator;
  final bool isSkipped;
  final AppParams params;
  AppHistoryEntry(
    this.key,
    this.path,
    this.params,
    this.navigator,
    this.isSkipped
  );

  bool isSame(AppHistoryEntry other) =>
    path == other.path && navigator == other.navigator;
}