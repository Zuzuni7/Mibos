import 'package:flutter/material.dart';
import 'package:mibos_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'globals.dart';

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

  void updateData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final data1 =
        await firestore.collection('goals').doc('dh2U5PjPbWGjKMkPaMqw').get();
    final data2 = await firestore
        .collection('percents')
        .doc('percentageCalcs')
        .get(); //get the data

    // SELECT goal mAmt to compare against current mAmt
    // These are the target goal amounts
    var mAmt = double.parse(data1['mind'][3]);
    var bAmt = double.parse(data1['body'][3]);
    var sAmt = double.parse(data1['spirit'][3]);

    // These are the current amounts that will be updated by the user
    firestore
        .collection('percents')
        .doc('percentageCalcs')
        .update({'currMmAmt': double.parse(Mcontroller.text)});
    firestore
        .collection('percents')
        .doc('percentageCalcs')
        .update({'currBmAmt': double.parse(Bcontroller.text)});
    firestore
        .collection('percents')
        .doc('percentageCalcs')
        .update({'currSmAmt': double.parse(Scontroller.text)});

    firestore
        .collection('percents')
        .doc('percentageCalcs')
        .update({'mindPercent': mindPercent});
    firestore
        .collection('percents')
        .doc('percentageCalcs')
        .update({'bodyPercent': bodyPercent});
    firestore
        .collection('percents')
        .doc('percentageCalcs')
        .update({'spiritPercent': spiritPercent});
    // Calculations for total percentage and progress bar
    mindPercent = double.parse(Mcontroller.text) / mAmt;
    bodyPercent = double.parse(Bcontroller.text) / bAmt;
    spiritPercent = double.parse(Scontroller.text) / sAmt;

    percent = (mindPercent + bodyPercent + spiritPercent) / 3;
    if (percent > 1 || percent < 0) {
      print('Ya dun messed up somewhere aaron');
    }
  }

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
                    horizontal: MediaQuery.of(context).size.width * 0.5 * 0.5),
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

              updateData();

              Navigator.pop(context);
            },
            child: Text('Submit Changes', style: TextStyle(fontSize: 30)),
          ),
        ));
  }
}
