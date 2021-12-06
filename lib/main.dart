import 'package:flutter/material.dart';
import 'package:mibos_app/home_screen.dart';
import 'goal_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'updateGoals.dart';

// double percent = 0.0;
// double currMmAmt = 0;
// double currBmAmt = 0;
// double currSmAmt = 0;
// double mindPercent = 0.0;
// double bodyPercent = 0.0;
// double spiritPercent = 0.0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  extractData();
  runApp(MyApp());
}

String docID = 'dh2U5PjPbWGjKMkPaMqw';

// //Map<String, dynamic> data = .data()! as Map<String, dynamic>;
// final data = firestore.collection('percents').doc('percentageCalcs').get();

extractData() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final data =
      await firestore.collection('percents').doc('percentageCalcs').get();

  double percent = 0.9;
  double currMmAmt = data['currMmAmt'];
  double currBmAmt = data['currBmAmt'];
  double currSmAmt = data['currSmAmt'];

  double mindPercent = data['mindPercent'];
  double bodyPercent = data['bodyPercent'];
  double spiritPercent = data['spiritPercent'];
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Genos'),
      home: HomePage(),
      initialRoute: ',',
      routes: {
        GoalsScreen.routeName: (ctx) => GoalsScreen(),
        UpdateGoals.routeName: (ctx) => UpdateGoals()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
