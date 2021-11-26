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
  void updateDB() {}

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
            // call function that updates Firebase.
            // Do I need to refresh the instance?
            Navigator.pop(context);
          },
          child: Text('Submit Changes'),
        ),
      ),
    );
  }
}

// This class is supposed to be for formatting the form entry but I might delete it later...
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
