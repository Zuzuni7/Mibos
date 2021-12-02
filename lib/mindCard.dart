import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class MindCard extends StatefulWidget {
  const MindCard({Key? key}) : super(key: key);

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<MindCard> {
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
              title: Text(data['mind'][1]),
              subtitle: Text(data['mind'][0]),
              leading: Text(data['mind'][4]),
              trailing:
                  Text(data['mind'][3] + ' ' + data['mind'][2] + 'remaining'),
            );
          }).toList(),
        );
      },
    );
  }
}
