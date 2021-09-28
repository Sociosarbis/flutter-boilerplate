import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ValueNotifier<T> useWatchState<T>(T Function() initialStateGetter, List<dynamic> deps) {
  final state = useState(initialStateGetter());
  useEffect(() {
    state.value = initialStateGetter();
  }, deps);
  return state;
}