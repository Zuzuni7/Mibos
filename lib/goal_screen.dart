import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
//import 'package:flutter/src/widgets/navigator.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({Key? key}) : super(key: key);
  static const routeName = '/goals_screen';

// Future function

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Goals"),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white10,
          alignment: Alignment.topCenter,
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Update Goals'),
            ),
          ),
        ));
  }
}

// goal widget input forms
// Takes in name, details, mType, & mAmt

class GoalsForm extends StatefulWidget {
  const GoalsForm(String name, String details, String mType, int mAmt,
      {Key? key})
      : super(key: key);

  final String name = '';
  final String details = '';
  final String mType = '';
  final int mAmt = 0;

  @override
  _GoalsFormState createState() => _GoalsFormState();
}

class _GoalsFormState extends State<GoalsForm> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
