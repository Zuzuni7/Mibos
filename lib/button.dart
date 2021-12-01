import 'package:flutter/material.dart';
import 'package:mibos_app/goal_screen.dart';
import 'updateGoals.dart';

class EditGoals extends StatelessWidget {
  //const EditGoals{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GoalsScreen()));
            },
            child: const Text(
              'Edit Goals',
              style: TextStyle(fontSize: 30),
            ))
      ],
    );
  }
}

class UpdateGoalsButton extends StatelessWidget {
  //const EditGoals{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UpdateGoals()));
            },
            child: const Text(
              'Update Goals',
              style: TextStyle(fontSize: 30),
            ))
      ],
    );
  }
}
