
import 'package:flutter/material.dart';
import 'package:mibos_app/home_screen.dart';
import 'goal_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: HomePage(),
      initialRoute: ',',
      routes: {
        GoalsScreen.routeName: (ctx) => GoalsScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
