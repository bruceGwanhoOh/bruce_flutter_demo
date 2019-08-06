import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:math_expressions/math_expressions.dart';

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
                        fontWeight: FontWeight.bold)),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btnAC(
                  'AC',
                  const Color(0xFFF5F7F9),
                ),
                btnClear(),
                btn(
                  '%',
                  const Color(0xFFF5F7F9),
                ),
                btn(
                  '/',
                  const Color(0xFFF5F7F9),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btn('7', Colors.white),
                btn('8', Colors.white),
                btn('9', Colors.white),
                btn(
                  '*',
                  const Color(0xFFF5F7F9),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btn('4', Colors.white),
                btn('5', Colors.white),
                btn('6', Colors.white),
                btn(
                  '-',
                  const Color(0xFFF5F7F9),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btn('1', Colors.white),
                btn('2', Colors.white),
                btn('3', Colors.white),
                btn('+', const Color(0xFFF5F7F9))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btn('0', Colors.white),
                btn('.', Colors.white),
                btnEqual('=')
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget btn(String btnText, Color btnColor) {
    return Container(
        padding: EdgeInsets.only(bottom: 10.0),
        child: FlatButton(
          child: Text(
            btnText,
            style: TextStyle(
                fontSize: 28, color: Colors.black, fontFamily: 'RobotoMono'),
          ),
          onPressed: () {
            setState(() {
              _textControllerInput.text += btnText;
            });
          },
          color: btnColor,
          padding: EdgeInsets.all(18.0),
          splashColor: Colors.black,
          shape: CircleBorder(),
        ));
  }

  Widget btnAC(String btnText, Color btnColor) {
    return Container(
        padding: EdgeInsets.only(bottom: 10.0),
        child: FlatButton(
          child: Text(
            btnText,
            style: TextStyle(
                fontSize: 28, color: Colors.black, fontFamily: 'RobotoMono'),
          ),
          onPressed: () {
            setState(() {
              _textControllerInput.text = "";
              _textControllerResult.text = "";
            });
          },
          color: btnColor,
          padding: EdgeInsets.all(18.0),
          splashColor: Colors.black,
          shape: CircleBorder(),
        ));
  }

  Widget btnClear() {
    return Container(
        padding: EdgeInsets.only(bottom: 10.0),
        child: FlatButton(
          child: Icon(
            Icons.backspace,
            size: 15,
            color: Colors.blueGrey,
          ),
          onPressed: () {
            _textControllerInput.text = (_textControllerInput.text.length > 0)
                ? (_textControllerInput.text
                    .substring(0, _textControllerInput.text.length - 1))
                : "";
          },
          color: const Color(0xFFF5F7F9),
          padding: EdgeInsets.all(18.0),
          splashColor: Colors.black,
          shape: CircleBorder(),
        ));
  }

  Widget btnEqual(btnText) {
    return GradientButton(
      child: Text(
        btnText,
        style: TextStyle(fontSize: 35.0),
      ),
      increaseWidthBy: 40.0,
      increaseHeightBy: 10.0,
      callback: () {
        //Calculate everything here
        // Parse expression:
        Parser p = new Parser();
        // Bind variables:
        ContextModel cm = new ContextModel();
        Expression exp = p.parse(_textControllerInput.text);
        setState(() {
          _textControllerResult.text =
              exp.evaluate(EvaluationType.REAL, cm).toString();
        });
      },
      gradient: Gradients.jShine,
    );
  }
}
