import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';


T useProviderContext<T>(bool listen) {
  final context = useContext();
  return Provider.of<T>(context, listen: listen);
}
