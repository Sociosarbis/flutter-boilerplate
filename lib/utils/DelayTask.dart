import 'dart:async';

class DelayTask {
  Future<void>? _future;
  int id = 0;
  final int duration;
  DelayTask(this.duration);

  run(void Function() cb) {
    cancel();
    final curId = id;
    _future = Future.delayed(Duration(milliseconds: duration)).then((value) {
      if (curId == id) {
        cb();
      }
    });
  }

  cancel() {
    id += 1;
    _future?.timeout(Duration(milliseconds: 0), onTimeout: () {});
  }
}