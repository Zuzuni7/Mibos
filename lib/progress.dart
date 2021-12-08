import 'package:flutter/material.dart';
import 'package:mibos_app/main.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'globals.dart';

class ReportProgress extends StatefulWidget {
  const ReportProgress({Key? key}) : super(key: key);

  @override
  _ReportProgressState createState() => _ReportProgressState();
}

class _ReportProgressState extends State<ReportProgress>
    with TickerProviderStateMixin {
  late AnimationController controller;
  var percent;
  @override
  void initState() {
    percent = Globals().getPercent();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..addListener(() {
            setState(() {});
          });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // calcPercentage(dbl) {
  //   return dbl * 100;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Text(
            'Current Progress: ' + double.parse(percent).toString() + '%',
            style: TextStyle(fontSize: 20),
          ),
          LinearPercentIndicator(
            animation: true,
            percent: percent,
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    );
  }
}


/**
 * This widget serves the purpose of reporting progress towards goals
 * 
 * Functionality
 * 1. Pull data from the firebase
 * 2. Display progress bars. Return Bars
 * 3. Do math for calculating percentages
 * 
 */