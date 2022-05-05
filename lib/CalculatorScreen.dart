import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ResultScreen.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({title});
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  var inputOne = TextEditingController();
  var inputSecond = TextEditingController();
  bool _floatingActionButtonState = false;

  @override
  void dispose() {
    inputOne.dispose();
    inputSecond.dispose();
    super.dispose();
  }

  int result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Calculator'),
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            Flexible(
                child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  controller: inputOne,
                  onSubmitted: _onSubmitted,
                  //to check if text in inside the textfield
                  //you must call the onChanged parameter to be able to track the text input
                  onChanged: (String text) {
                    setState(() {});
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: inputSecond,
                  onChanged: (String text) {
                    setState(() {});
                  },
                ),
                Divider(height: 20.0, thickness: 0.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(right: 50.0)),
                    FlatButton(
                      onPressed: _trackState()
                          ? () => _addNum(inputOne, inputSecond)
                          : null,
                      child: Text("Add"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.orangeAccent)),
                      color: Colors.white,
                      textColor: Colors.red,
                      padding: EdgeInsets.all(8.0),
                    ),
                    Padding(padding: EdgeInsets.only(right: 35.0)),
                    FlatButton(
                      onPressed: _trackState()
                          ? () => _subNum(inputOne, inputSecond)
                          : null,
                      child: Text("Sub"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.orangeAccent)),
                      color: Colors.white,
                      textColor: Colors.red,
                      padding: EdgeInsets.all(8.0),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(right: 50.0)),
                    FlatButton(
                      onPressed: _trackState()
                          ? () => _multiplyNum(inputOne, inputSecond)
                          : null,
                      child: Text("Multiply"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.orangeAccent)),
                      color: Colors.white,
                      textColor: Colors.red,
                      padding: EdgeInsets.all(8.0),
                    ),
                    Padding(padding: EdgeInsets.only(right: 35.0)),
                    FlatButton(
                      onPressed: _trackState()
                          ? () => _divideNum(inputOne, inputSecond)
                          : null,
                      child: Text("Divide"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.orangeAccent)),
                      color: Colors.white,
                      textColor: Colors.red,
                      padding: EdgeInsets.all(8.0),
                    ),
                  ],
                )
              ],
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        foregroundColor: Colors.grey,
        onPressed: _floatingActionButtonState ? () => _navigate() : null,
        child: Icon(
          Icons.send,
          color: Colors.white,
        ),
      ),
    );
  }

  _addNum(TextEditingController inOne, TextEditingController inTwo) {
    int x = int.parse(inputOne.text);
    int y = int.parse(inputSecond.text);
    setState(() {
      _floatingActionButtonState = true;
    });
    result = x + y;
  }

  _subNum(inOne, inTwo) {
    int x = int.parse(inputOne.text);
    int y = int.parse(inputSecond.text);
    setState(() {
      _floatingActionButtonState = true;
    });    result = x - y;
  }

  _divideNum(inOne, inTwo) {
    int x = int.parse(inputOne.text);
    int y = int.parse(inputSecond.text);
    setState(() {
      _floatingActionButtonState = true;
    });    result = (x / y) as int;
  }

  _multiplyNum(inOne, inTwo) {
    int x = int.parse(inputOne.text);
    int y = int.parse(inputSecond.text);
    setState(() {
      _floatingActionButtonState = true;
    });    result = x * y;
  }

  _onSubmitted(String text){
    inputOne.clear();
    inputSecond.clear();
    _trackState();
  }
  _navigate() {
    Navigator.of(context).pushNamed('/a');
    setState(() {
      text = result.toString();
      _onSubmitted(text);
    });
  }

  //to track the state of the button (gozie wrote this code on his own and implemented the logic on his own). His is a good programmer
  bool _trackState(){
    bool check;
    setState(() {
      if(inputOne.text.length > 0 && inputSecond.text.length > 0){
        check = true;
      } else{
         check = false;
      }
    });
    return check;
  }
}
