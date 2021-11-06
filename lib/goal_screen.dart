import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
//import 'package:flutter/src/widgets/navigator.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({Key? key}) : super(key: key);
  static const routeName = '/goals_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Goals"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Update JSON
          },
          child: Text('Save Goals!'),
        ),
      ),
    );
  }
}
