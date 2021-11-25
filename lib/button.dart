import 'package:flutter/material.dart';
import 'package:mibos_app/goal_screen.dart';

class ButtonNav extends StatelessWidget {
  const ButtonNav({Key? key}) : super(key: key);

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
            child: const Text('Edit Goals'))
      ],
    );
  }
}
