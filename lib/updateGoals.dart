import 'package:flutter/material.dart';

class UpdateGoals extends StatefulWidget {
  const UpdateGoals({Key? key}) : super(key: key);
  static const routeName = '/updateGoals';

  @override
  _UpdateGoalsState createState() => _UpdateGoalsState();
}

class _UpdateGoalsState extends State<UpdateGoals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Goals Screen'),
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              child: TextField(
                keyboardType: TextInputType.text,
              ),
            ),
          ],
        ),
        color: Colors.white,
      ),
    );
  }
}
