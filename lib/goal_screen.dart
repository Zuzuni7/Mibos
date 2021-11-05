import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
//import 'package:flutter/src/widgets/navigator.dart';
import 'main.dart';

class GoalsScreen extends MyApp {
  static const routeName = '/goals_screen';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context) as Map<String, String>;

    return Text(routeName);
  }
}
