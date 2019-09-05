import 'package:bruce_flutter_demo/src/widgets/googlemap_widget.dart';
import 'package:bruce_flutter_demo/src/widgets/map_widget.dart';
import 'package:bruce_flutter_demo/src/widgets/runmainoption_widget.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key key}) : super(key: key);

  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Map Screen'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: GoogleMapWidget()
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: MapWidget()),
              RunMainOption()

            ],
          )),
    );
  }
}
