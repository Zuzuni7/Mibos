import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mibos_app/button.dart';
import 'package:mibos_app/mindCard.dart';
import 'package:mibos_app/spiritCard.dart';
import 'bodyCard.dart';
import 'avatar.dart';
import 'button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MiBoS'),
        leading: Image.asset('assets/images/icon.png'),
        centerTitle: true,
        toolbarHeight: 100, // default is 56
        toolbarOpacity: 0.5,
        shadowColor: Colors.blue,
        backgroundColor: Colors.white,
        elevation: 10,
      ),
      body: ListView(shrinkWrap: true, children: [
        BodyCard(),
        SpiritCard(),
        MindCard(),
        ButtonNav()
      ] // This child widget is breaking the everything and idky
          ),
      backgroundColor: Colors.tealAccent,
      //The Avatar GIF needs to be extrapolated
      bottomNavigationBar: Container(
          height: 350,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomCenter,
          child: Avatar()),
    );
  }
}
