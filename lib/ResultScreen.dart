import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String text;
class NewScreen extends StatefulWidget {
  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Screen"),
      ),
      body: Center(
        child: Text(text),
      ),
    );
  }
}


