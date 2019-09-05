import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: new RawMaterialButton(
      onPressed: () {},
      child: new Icon(
        Icons.play_arrow,
        color: Colors.white,
        size: 60.0,
      ),
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.red,
      padding: const EdgeInsets.all(15.0),
    ));
  }
}
