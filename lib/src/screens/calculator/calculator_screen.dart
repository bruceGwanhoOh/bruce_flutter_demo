import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({Key key}) : super(key: key);

  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String strInput = "";
  final _textControllerInput = TextEditingController();
  final _textControllerResult = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textControllerInput.addListener(() {
      print('add listener');
    });
    _textControllerResult.addListener(() => {});
  }

  @override
  void dispose() {
    super.dispose();
    _textControllerInput.dispose();
    _textControllerResult.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration.collapsed(
                    hintText: "0",
                    hintStyle: TextStyle(
                      fontSize: 30,
                      fontFamily: 'RobotoMono',
                    )),
                style: TextStyle(fontSize: 30, fontFamily: 'RobotoMono'),
                textAlign: TextAlign.right,
                controller: _textControllerInput,
                onTap: () {
                  print("Tapped ");
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration.collapsed(
                    hintText: "0",
                    hintStyle: TextStyle(
                      fontSize: 30,
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.bold
                    )),
                style: TextStyle(fontSize: 30, fontFamily: 'RobotoMono'),
                textAlign: TextAlign.right,
                controller: _textControllerResult,
                onTap: () {
                  print("Tapped ");
                },
              ),
            ),
            SizedBox(width: 0.0, height: 20.0),
            Row(
              children: <Widget>[Text('text')],
            ),
            Row(
              children: <Widget>[Text('text')],
            ),
            Row(
              children: <Widget>[Text('text')],
            ),
            Row(
              children: <Widget>[Text('text')],
            ),
            Row(
              children: <Widget>[Text('text')],
            )
          ],
        ),
      ),
    );
  }
}
