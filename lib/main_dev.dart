import 'package:flutter/material.dart';
import 'my_app.dart';
import 'env.dart';



void main() {
  Environment.init(env: EnvironmentFlavor.development);
  runApp(MyApp());
}