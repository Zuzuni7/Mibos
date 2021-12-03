import 'package:flutter/material.dart';
import 'package:mibos_app/main.dart';

class UpdateGoals extends StatefulWidget {
  const UpdateGoals({Key? key}) : super(key: key);
  static const routeName = '/updateGoals';

  @override
  _UpdateGoalsState createState() => _UpdateGoalsState();
}

class _UpdateGoalsState extends State<UpdateGoals> {
  final Mcontroller = TextEditingController();
  final Bcontroller = TextEditingController();
  final Scontroller = TextEditingController();

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
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.25 * 0.5),
                child: TextField(
                    controller: Mcontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText:
                            'Update on what has been done so far. (Mind)')),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.25 * 0.5),
                child: TextField(
                    controller: Bcontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText:
                            'Update on what has been done so far. (Body)')),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.25 * 0.5),
                child: TextField(
                    controller: Scontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText:
                            'Update on what has been done so far. (Spirit)')),
              ),
            ],
          ),
          color: Colors.white,
        ),
        bottomNavigationBar: Container(
          child: ElevatedButton(
            onPressed: () {
              //Update gbls
              currBmAmt = double.parse(Bcontroller.text);
              currMmAmt = double.parse(Mcontroller.text);
              currSmAmt = double.parse(Scontroller.text);
              Navigator.pop(context);
            },
            child: Text('Submit Changes', style: TextStyle(fontSize: 30)),
          ),
        ));
  }
}
