import 'package:bruce_flutter_demo/src/widgets/circle_button.dart';
import 'package:bruce_flutter_demo/src/widgets/googlemap_widget.dart';
import 'package:bruce_flutter_demo/src/widgets/runmainoption_widget.dart';
import 'package:flutter/material.dart';

class RunMainScreen extends StatelessWidget {
  const RunMainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMapWidget(),
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RunMainOption(),
                    RunMainOption(),
                    RunMainOption()
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text("You can put more widgets in this space")
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    child: CircleButton(),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
