import 'package:flutter_hooks/flutter_hooks.dart';

void usePreviousEffect(void Function() Function(List<dynamic>? oldValues) effect,
    List<dynamic> keys) {
  final oldValues = usePrevious(keys);
  useEffect(() {
    return effect(oldValues);
  }, keys);
}
