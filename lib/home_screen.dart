import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mibos'),
        backgroundColor: Color.alphaBlend(Colors.white, Colors.black),
      ),
      body: Center(child: Text('card')),
    );
  }
}
