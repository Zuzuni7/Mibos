import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'card_component.dart';
import 'avatar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mibos'),
        backgroundColor: Color.alphaBlend(Colors.white, Colors.white),
      ),
      body: Container(
        child: CardComponent(),
        alignment: Alignment.topCenter,
      ),
      backgroundColor: Colors.black,
      //The Avatar GIF needs to be extrapolated
      bottomNavigationBar: Container(
          height: 350,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomCenter,
          child: Avatar()),
    );
  }
}
