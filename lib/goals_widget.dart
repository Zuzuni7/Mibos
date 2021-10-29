import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Goal {
  final int id;
  final String name; // Name of the goal
  final String type; // Goal type MBS
  final String details; // description of goal
  final String measurementType; // Time, distance, Ounces
  final int measurementAmount; // numerical value for measurement type

  const Goal(
      {@required this.id,
      @required this.name,
      @required this.type,
      @required this.details,
      @required this.measurementType,
      @required this.measurementAmount});
}
