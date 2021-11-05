import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mibos_app/goal_screen.dart';
import 'package:mibos_app/models/data.dart';
import 'goal_item.dart';
import 'goals.dart';

/** 
 * Card Component should consist of 3 goal_progression components
 * Clicking the Card should open the goals page where goals can be selected
 * 
*/

class Goals extends StatefulWidget {
  const Goals({Key? key}) : super(key: key);

  final String goalName = '';

  @override
  _GoalsState createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: ListView(
        children: <Widget>[
          Goal(1, 'Run', 'Body', 'Run 2 miles', 'miles', 2),
          Goal(2, 'Meditate', 'Mind', 'Medidate 20 min', 'min', 20),
          Goal(3, 'Pray', 'Spirit', 'Pray 2 times', 'count', 2)
        ],
        padding: EdgeInsets.only(
            left: 10, top: 25, right: 10, bottom: 10), // space between
      ),
    );
  }
}

const KeepLive = true;
/********************************************************** */

class CardComponent extends StatefulWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<CardComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      height: 275,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
      ),
      child: ListView(
          padding: EdgeInsets.only(
              left: 10, top: 25, right: 10, bottom: 10), // space between
          children: <Widget>[Goals(), Goals(), Goals()]), // goal progression
    );
  }
}
