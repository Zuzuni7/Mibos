//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'goals.dart';
import 'goal_screen.dart';

class GoalItem extends StatelessWidget {
  final String id;
  final String name;
  final String type;
  final String details; // description of goal
  final String measurementType; // Time, distance, Ounces
  final int measurementAmount;

  GoalItem(this.id, this.name, this.type, this.details, this.measurementType,
      this.measurementAmount);

  void selectGoal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(GoalsScreen.routeName, arguments: {'id': id, 'title': name});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectGoal(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Text(name),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        ));
  }
}
