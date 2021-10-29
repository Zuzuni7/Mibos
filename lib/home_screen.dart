import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'card_component.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mibos'),
        backgroundColor: Color.alphaBlend(Colors.white, Colors.black),
      ),
      body: Container(
        child: CardComponent(),
        alignment: Alignment.topCenter,
      ),
      backgroundColor: Colors.tealAccent,
    );
  }
}
