import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class UserStore with ChangeNotifier {
  Map<String, String> cookie = Map<String, String>();
  bool _isLoggingIn = false;

  String get cookieStr {
    List<String> arr = [];
    cookie.forEach((k, v) {
      arr.add("$k=$v");
    });
    return arr.join("; ");
  }

  bool get isAuth {
    return cookie.containsKey('chii_auth');
  }

  set isLogining(bool state) {
    _isLoggingIn = state;
    notifyListeners();
  }

  get isLogining {
    return _isLoggingIn;
  }

  setCookie(Map<String, String> c) {
    cookie = c;
    notifyListeners();
  }
}

UserStore useUserStore(bool listen) {
  return useMemoized(() {
    return Provider.of<UserStore>(useContext(), listen: listen);
  }, [listen]);
}
