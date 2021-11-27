import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class BodyCard extends StatefulWidget {
  const BodyCard({Key? key}) : super(key: key);

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<BodyCard> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('goals').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['body'][1]),
              subtitle: Text(data['body'][0]),
              leading: Text(data['body'][4]),
              trailing: Text(data['body'][3] + ' ' + data['body'][2]),
            );
          }).toList(),
        );
      },
    );
  }
}

class BodyProgress extends StatefulWidget {
  @override
  _BodyProgress createState() => _BodyProgress();
}

class _BodyProgress extends State<BodyProgress> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios_rounded),
        onPressed: () {
          setState(() {
            loading = !loading;
          });
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38),
        child: Center(
          child: loading
              ? LinearProgressIndicator(
                  backgroundColor: Colors.red,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                )
              : Text(
                  "No task to do",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}



// ElevatedButton(
//             child: const Text('Edit Goals'),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => GoalsScreen()),
//               );
//             },
//           ),