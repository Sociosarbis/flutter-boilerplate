import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/services/bgm.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FutureCacheBuilder<T> extends HookWidget {
  final Future<T> Function() futureBuilder;
  final Future<T?> Function()? cacheBuilder;
  final List<Object?> deps;
  final T? initialData;
  final Widget Function(BuildContext context, AsyncSnapshot<T> snapshot,
      AsyncSnapshot<T?> cacheSnapShot) builder;
  const FutureCacheBuilder(
      {required this.futureBuilder,
      required this.builder,
      this.cacheBuilder,
      this.deps = const [],
      this.initialData,
      super.key});

  @override
  Widget build(BuildContext context) {
    final future = useMemoized(this.futureBuilder, deps);
    final cacheFuture = useMemoized(() async {
      return cacheBuilder?.call();
    }, deps);

    useEffect(() {
      return () {
        if (future is CancellableFuture) {
          (future as CancellableFuture).cancel();
        }
      };
    }, deps);
    return FutureBuilder(
        future: cacheFuture,
        builder: (_, cacheSnapshot) {
          return FutureBuilder(
              builder: (context, snapshot) {
                return builder(context, snapshot, cacheSnapshot);
              },
              initialData: initialData,
              future: future);
        });
  }
}
