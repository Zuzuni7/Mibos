import 'package:flutter/cupertino.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Goal extends StatelessWidget {
  final int id;
  final String name; // Name of the goal
  final String type; // Goal type MBS
  final String details; // description of goal
  final String measurementType; // Time, distance, Ounces
  final int measurementAmount; // numerical value for measurement type

  const Goal(this.id, this.name, this.type, this.details, this.measurementType,
      this.measurementAmount);

  Widget build(BuildContext context) {
    return Container(
      child: Text(this.details),
    );
  }
}
