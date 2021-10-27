import 'package:flutter/material.dart';
import 'dart:async';

class Splash3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GeeksForGeeks")),
      body: Center(
          child: Text(
        "Home Page",
        textScaleFactor: 2,
      )),
    );
  }
}
