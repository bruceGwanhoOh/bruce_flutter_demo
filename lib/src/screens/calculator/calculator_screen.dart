import 'package:bruce_flutter_demo/src/uimodels/button/action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({Key key}) : super(key: key);

  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  void _plus(){
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: "0",
                      hintStyle:
                          TextStyle(fontSize: 30, fontFamily: 'RobotoMono')),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'RobotoMono',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: "0",
                      hintStyle:
                          TextStyle(fontSize: 30, fontFamily: 'RobotoMono')),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'RobotoMono',
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[_button("1",_plus),_button("2",_plus),_button("3",_plus),_button("4",_plus)]),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[_button("1",_plus),_button("2",_plus),_button("3",_plus),_button("4",_plus)]),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[_button("1",_plus),_button("2",_plus),_button("3",_plus),_button("4",_plus)]),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[_button("1",_plus),_button("2",_plus),_button("3",_plus),_button("4",_plus)]),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[_button("1",_plus),_button("2",_plus),_button("3",_plus),_button("4",_plus)]),
                
             
            ])));
  }
  
}

Widget _button (String number, Function() f){ 
    return MaterialButton(
      height: 100.0,
      child: Text(number,
      style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
      textColor: Colors.black,
      color: Colors.grey[100],
      onPressed: f,
    );
  }