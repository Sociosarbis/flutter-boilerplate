import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';



T useProviderContext<T>(bool listen) {
    return useMemoized(() {
    return Provider.of<T>(useContext(), listen: listen);
  }, [listen]);
}