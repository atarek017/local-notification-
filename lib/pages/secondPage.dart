import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String payload;

  SecondPage({this.payload});

  @override
  State<StatefulWidget> createState() {
    return _SecondPageState();
  }
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Text(widget.payload),
        ),
      ),
    );
  }
}
