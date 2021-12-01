import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  final String condition;

  Avatar(this.condition);

  @override
  _AvatarState createState() => _AvatarState(condition);
}

class _AvatarState extends State<Avatar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final String condition; // String recieved from default constructor

  _AvatarState(this.condition);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Add logic for conditions and avatar display
    return Container(
      child: Image.asset(
        condition,
        height: 250.0,
        width: 250.0,
      ),
    );
  }
}
