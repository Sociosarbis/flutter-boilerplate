import 'dart:async';

class Benchmark {
  final _stopWatch = Stopwatch();

  void _onComplete() {
    print(_stopWatch.elapsed);
    _stopWatch.stop();
    _stopWatch.reset();
  }

  FutureOr<void> run(FutureOr<void> Function() cb) {
    _stopWatch.start();
    final res = cb();
    if (res is Future) {
      res.whenComplete(_onComplete);
      return res;
    }
    _onComplete();
  }
}
