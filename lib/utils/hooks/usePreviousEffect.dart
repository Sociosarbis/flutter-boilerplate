import 'package:flutter_hooks/flutter_hooks.dart';

void usePreviousEffect(void Function() Function(List<Object> oldValues) effect,
    List<Object> keys) {
  final oldValues = usePrevious(keys);
  useEffect(() {
    return effect(oldValues);
  }, keys);
}
