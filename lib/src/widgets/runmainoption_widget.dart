import 'package:flutter/material.dart';

class RunMainOption extends StatelessWidget {
  const RunMainOption({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 120,
      height: 88,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Container(child: Text("Icon"))],
          ),
          Container(height: 0.5, color: Colors.black,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Container(child: Text("Name"))],
          ),
        ],
      ),
    );
  }
}
