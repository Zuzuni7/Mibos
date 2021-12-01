import 'package:flutter/material.dart';

class ReportProgress extends StatefulWidget {
  const ReportProgress({Key? key}) : super(key: key);

  @override
  _ReportProgressState createState() => _ReportProgressState();
}

class _ReportProgressState extends State<ReportProgress>
    with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          const Text(
            'Current Progress:',
            style: TextStyle(fontSize: 20),
          ),
          LinearProgressIndicator(
            value: controller.value,
            semanticsLabel: 'Linear Progress Indicator',
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
 * 3. Do math for calculating percentages??
 * 4.
 */