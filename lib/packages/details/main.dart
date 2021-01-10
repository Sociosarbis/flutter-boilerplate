import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Details")),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back!'))));
  }
}
