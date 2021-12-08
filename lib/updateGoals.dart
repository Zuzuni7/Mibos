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

    /** 
     * Named arguments setters here
     * */

    Globals().setGlobals(currMmAmt: double.parse(Mcontroller.text));
    Globals().setGlobals(currBmAmt: double.parse(Bcontroller.text));
    Globals().setGlobals(currSmAmt: double.parse(Scontroller.text));

    var currMmAmt = await Globals().getCurrMmAmt();
    var currBmAmt = await Globals().getCurrBmAmt();
    var currSmAmt = await Globals().getCurrSmAmt();

    var mindPercent = await Globals().getMindPercent();
    var bodyPercent = await Globals().getBodyPercent();
    var spiritPercent = await Globals().getSpiritPercent();

    var percent = await Globals().getPercent();

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
    mindPercent = currMmAmt / mAmt;
    bodyPercent = currBmAmt / bAmt;
    spiritPercent = currSmAmt / sAmt;

    percent = (mindPercent + bodyPercent + spiritPercent) / 3;
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
              updateData();

              Navigator.pop(context);
            },
            child: Text('Submit Changes', style: TextStyle(fontSize: 30)),
          ),
        ));
  }
}
