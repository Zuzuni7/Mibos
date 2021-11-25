import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mibos_app/spiritCard.dart';
import 'bodyCard.dart';
import 'avatar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mibos'),
        backgroundColor: Color.alphaBlend(Colors.white, Colors.white),
      ),
      body: ListView(children: [
        BodyCard(),
        SpiritCard()
      ] // This child widget is breaking the everything and idky
          ),
      backgroundColor: Colors.white,
      //The Avatar GIF needs to be extrapolated
      bottomNavigationBar: Container(
          height: 350,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomCenter,
          child: Text('Avatar()')),
    );
  }
}
