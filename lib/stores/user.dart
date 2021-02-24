import 'package:flutter/material.dart';

class UserStore with ChangeNotifier {
  Map<String, String> cookie = Map<String, String>();

  String get cookieStr {
    List<String> arr = [];
    cookie.forEach((k, v) {
      arr.add("$k=$v");
    });
    return arr.join("; ");
  }

  setCookie(Map<String, String> c) {
    cookie = c;
    notifyListeners();
  }
}
