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
          title: const Text('MiBoS',
              style: TextStyle(
                  color: Colors.black, fontSize: 50, fontFamily: 'Genos')),
          textTheme: TextTheme(
              headline6: TextStyle(color: Colors.black, fontFamily: 'Genos')),
          leading: Image.asset('assets/images/icon.png'),
          centerTitle: true,
          toolbarHeight: 100, // default is 56
          toolbarOpacity: 0.5,
          shadowColor: Colors.blue,
          backgroundColor: Colors.white,
          elevation: 10,
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            BodyCard(),
            SpiritCard(),
            MindCard(),
            ButtonNav()
          ], // This child widget is breaking the everything and idky
          padding: EdgeInsets.all(20),
        ),
        backgroundColor: Colors.white,

        //The Avatar GIF needs to be extrapolated
        bottomNavigationBar: Container(
            height: 350,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                if (true == true)
                  Avatar('assets/images/BMO.gif')
                else
                  (Avatar('assets/images/avatar110.gif')),
              ],
            )));
  }
}
