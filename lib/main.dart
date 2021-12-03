import 'package:flutter/material.dart';
import 'package:mibos_app/home_screen.dart';
import 'goal_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'updateGoals.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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

// Implemented into firebase
double percent = 0.0;
double currMmAmt = 0;
double currBmAmt = 0;
double currSmAmt = 0;
double mindPercent = 0.0;
double bodyPercent = 0.0;
double spiritPercent = 0.0;
String docID = 'dh2U5PjPbWGjKMkPaMqw';
