import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

import 'MindGoal.dart';
import 'BodyGoal.dart';
import 'SpiritGoal.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({Key? key}) : super(key: key);
  static const routeName = '/goals_screen';

  //Would the controllers go here? no bc here is a stateless widget.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Goals"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 100,
        color: Colors.white10,
        alignment: Alignment.topCenter,
        child: ListView(
            padding: EdgeInsets.all(30),
            shrinkWrap: true,
            children: [MindGoal(), BodyGoal(), SpiritGoal()]),
      ),
      bottomNavigationBar: Container(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Submit Changes'),
        ),
      ),
    );
  }
}

class EditGoalsHeader extends StatelessWidget {
  const EditGoalsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(""),
      padding: EdgeInsets.all(30),
    );
  }
}
