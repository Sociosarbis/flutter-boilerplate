import 'package:flutter_hooks/flutter_hooks.dart';

T? useLifeStyle<T>(T Function() onInit, void Function(T) onDispose) {
  final item = useRef<T?>(null);
  useEffect(() {
    item.value = onInit();
    return () {
      onDispose(item.value!);
    };
  }, []);
  return item.value;
}