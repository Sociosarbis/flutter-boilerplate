import 'package:flutter/material.dart';

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

  bool get isLogining {
    return _isLoggingIn;
  }

  setCookie(Map<String, String> c) {
    cookie = c;
    notifyListeners();
  }
}

